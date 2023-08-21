import 'package:flutter/material.dart';
import '../classes/palette.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function() onPressed;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Palette.purple1,
        padding: const EdgeInsets.fromLTRB(50, 25, 50, 25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: TextStyle(
          color: Palette.purpleClear,
        ),
      ),
    );
    //child: Text(text),
  }
}
