import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/classes/palette.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.text,
    this.hint,
    this.teclado = TextInputType.text,
    this.obscureText = false,
    this.enable = true,
    this.controller,
  });
  const MyTextField.empty({super.key})
      : text = '',
        hint = '',
        teclado = TextInputType.text,
        obscureText = false,
        enable = true,
        controller = null;

  final String? text;
  final String? hint;
  final TextInputType teclado;
  final bool obscureText;
  final bool enable;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enable,
      style: TextStyle(
        // fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Palette.purple1,
      ),
      obscureText: obscureText,
      keyboardType: teclado,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(
          /* shadows: [
            Shadow(
              color: Palette.purple1,
              offset: const Offset(0, 0),
              blurRadius: 10,
            ),
          ], */
          color: Palette.purple1,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          decorationColor: Palette.purple4,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Palette.purple4,
          ),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: Palette.purple2,
          fontSize: 14,
        ),
        filled: true,
        fillColor: Palette.purpleClear,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
