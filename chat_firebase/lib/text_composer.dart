import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  const TextComposer({
    super.key,
    required this.sendMessage,
  });
  final Function({String? text, File? imgFile}) sendMessage;

  @override
  State<TextComposer> createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;
  TextEditingController controller = TextEditingController();

  void reset() {
    controller.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () async {
              final ImagePicker picker = ImagePicker();
              await picker.pickImage(source: ImageSource.camera).then(
                (xFile) {
                  if (xFile == null) return;
                  File file = File(xFile.path);
                  widget.sendMessage(imgFile: file);
                },
              ); //File file;
            },
            icon: const Icon(Icons.photo_camera),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration.collapsed(
                hintText: 'Enviar uma mensagem',
              ),
              onChanged: (text) {
                setState(() {
                  _isComposing = text.isNotEmpty;
                });
              },
              onSubmitted: (text) {
                widget.sendMessage(text: text);
                reset();
              },
            ),
          ),
          IconButton(
            onPressed: _isComposing
                ? () {
                    widget.sendMessage(text: controller.text);
                    reset();
                  }
                : null,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }

//   Future<String?> getImage() async {
//     final picker = ImagePicker();
//     try {
//       XFile? xFile = await picker.pickImage(source: ImageSource.camera);

//       if (xFile == null) {
//         return null;
//       } else {
//         return xFile.path;
//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
}
