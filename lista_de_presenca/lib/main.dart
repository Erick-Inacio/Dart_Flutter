import 'package:flutter/material.dart';
import 'package:lista_de_presenca/src/ui/home_page.dart';

void main() {
  runApp(const GerenciadorDePresenca());
}

class GerenciadorDePresenca extends StatelessWidget {
  const GerenciadorDePresenca({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
