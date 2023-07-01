import 'package:flutter/material.dart';
import '../classes/palette.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Palette.purple1,
        padding: const EdgeInsets.fromLTRB(50, 25, 50, 25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        'Teste',
        style: TextStyle(
          color: Palette.purpleClear,
        ),
      ),
    );
    //child: Text(text),
  }
}
