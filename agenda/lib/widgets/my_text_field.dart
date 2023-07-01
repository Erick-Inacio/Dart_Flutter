import 'package:flutter/material.dart';

import '../classes/cores_pink.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.errorText,

  });

  final String? errorText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          borderSide: BorderSide(
            color: Cores.pink,
          ),
        ),
        errorText: errorText,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(
              color: Colors.red,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          borderSide: BorderSide(
            color: Cores.pink,
          ),
        ),
        labelText: 'Adicione uma tarefa',
        hintText: 'Digite sua tarefa...',
        hintStyle: TextStyle(
          color: Cores.pink,
        ),
        labelStyle: TextStyle(
          color: Cores.pinkAccent,
        ),
      ),
      style: TextStyle(
        color: Cores.pink,
      ),
    );
  }
}
