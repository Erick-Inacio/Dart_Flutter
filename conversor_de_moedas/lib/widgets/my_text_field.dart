import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.label,
      required this.prefix,
      required this.control,
      required this.function,
      /* required this.formKey */});

  final String label;
  final String prefix;
  final TextEditingController control;
  final void Function(String) function;
  /* final GlobalKey<FormState> formKey; */

  @override
  Widget build(BuildContext context) {
    return TextField(
      /* validator: (value) {
        if (control.text.isEmpty) {
          return null;
        } else {
          return function;
        }
      }, */
      controller: control,
      onChanged: /* (value) {
        if (formKey.currentState!.validate()) {
          function;
        }
      }, */

      function,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.amber,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(
            color: Colors.amber,
          ),
        ),
        prefixText: prefix,
      ),
      style: const TextStyle(
        color: Colors.amber,
        fontSize: 25,
      ),
    );
  }
}
