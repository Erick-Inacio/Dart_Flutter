import 'package:app_imc/pages/tela_imc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Imc());
}

class Imc extends StatelessWidget {
  const Imc({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: ImcPage());
  }
}
