import 'package:flutter/material.dart';
import '../helpers/contact_helper.dart';

class ContactPage extends StatefulWidget {
  final Contact? contact;

  const ContactPage({
    super.key,
    this.contact,
  });

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final TextEditingController _nameControl = TextEditingController();
  final TextEditingController _emailControl = TextEditingController();
  final TextEditingController _phoneControl = TextEditingController();

  final _nameFocus = FocusNode();

  late Contact _editedContact;
  bool _userEdited = false;

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact!.toMap());
    }

    // if (_editedContact.img != null && File(_editedContact.img!).existsSync()) {
    //   print("O arquivo existe!");
    // } else {
    //   print("O arquivo não existe no caminho especificado.");
    // }

    // // _editedContact.img =
    // //     'C:/Users/erick/Desktop/Faculdade/Dart.Flutter/agenda_contatos/images';
    // print("Caminho da imagem: ${_editedContact.img}");

    _nameControl.text = _editedContact.name ?? '';
    _emailControl.text = _editedContact.email ?? '';
    _phoneControl.text = _editedContact.phone ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(_editedContact.name ?? 'Novo Contato'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_editedContact.name != null &&
                _editedContact.name!.isNotEmpty) {
              Navigator.pop(context, _editedContact);
            } else {
              FocusScope.of(context).requestFocus(_nameFocus);
            }
          },
          backgroundColor: Colors.purple,
          child: const Icon(Icons.save),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('images/person.jpg'),
                    ),
                  ),
                ),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Nome',
                ),
                onChanged: (text) {
                  _userEdited = true;
                  setState(() {
                    _editedContact.name = text;
                  });
                },
                controller: _nameControl,
                focusNode: _nameFocus,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                onChanged: (text) {
                  _userEdited = true;
                  _editedContact.email = text;
                },
                keyboardType: TextInputType.emailAddress,
                controller: _emailControl,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Telefone',
                ),
                onChanged: (text) {
                  _userEdited = true;
                  _editedContact.phone = text;
                },
                keyboardType: TextInputType.phone,
                controller: _phoneControl,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Descartar Alterações?'),
            content: const Text('Se sair as alterações serão perdidas'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text('Sim'),
              ),
            ],
          );
        },
      );
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
