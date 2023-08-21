import 'package:buscador_de_gifs/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BuscadorGifs());
}

class BuscadorGifs extends StatelessWidget {
  const BuscadorGifs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        hintColor: Colors.white,
      ),
    );
  }
}
