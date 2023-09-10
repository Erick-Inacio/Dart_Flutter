import 'dart:io';
import 'package:chat_firebase/text_composer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  User? _currentUser;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      _currentUser = user;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('olá'),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('messages').snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  default:
                    List<DocumentSnapshot> documents =
                        snapshot.data!.docs.reversed.toList();
                    return ListView.builder(
                      itemCount: documents.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            (documents[index].data()!
                                as Map<String, dynamic>)['text'],
                          ),
                        );
                      },
                    );
                }
              },
            ),
          ),
          TextComposer(sendMessage: _sendMessage)
        ],
      ),
    );
  }

  Future<User?> _getUser() async {
    if (_currentUser != null) return _currentUser;
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuth =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuth.idToken,
          accessToken: googleSignInAuth.accessToken);

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? user = userCredential.user;

      return user;
    } catch (e) {
      return null;
    }
  }

  void _sendMessage({String? text, File? imgFile}) async {
    final User? user = await _getUser();

    if (user == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Não foi possível fazer o login. Tente novamente'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    Map<String, dynamic> data = {
      'uid': user!.uid,
      'senderName': user.displayName,
      'senderPhotoUrl': user.photoURL,
    };

    if (imgFile != null) {
      UploadTask task = FirebaseStorage.instance
          .ref()
          .child('Images')
          .child(DateTime.now().millisecondsSinceEpoch.toString())
          .putFile(imgFile);

      TaskSnapshot taskSnapshot = await task;
      String url = await taskSnapshot.ref.getDownloadURL();
      data['imgUrl'] = url;
    }

    if (text != null) data['text'] = text;

    FirebaseFirestore.instance.collection('messages').add(data);
  }
}
