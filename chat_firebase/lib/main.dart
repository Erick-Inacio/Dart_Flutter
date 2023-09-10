// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_firebase/chat_screen.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const Chat(),
  );

  // FirebaseFirestore.instance
  //     .collection('mensagens')
  //     .doc('msg2')
  //     .set({'texto': 'Tudo bem com vc?', 'from': 'Daniel', 'read': false});
}

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Flutter',
      debugShowCheckedModeBanner: false,
      home: const ChatScreen(),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          iconTheme: const IconThemeData(
            color: Colors.blue,
          )),
    );
  }
}
