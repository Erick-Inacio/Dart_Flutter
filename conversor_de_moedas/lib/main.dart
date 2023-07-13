import 'package:conversor_de_moedas/pages/conversor.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const ConversorMoedas());
}

class ConversorMoedas extends StatelessWidget {
  const ConversorMoedas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Conversor(),
      theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.amber,
      ),
    );
  }
}
