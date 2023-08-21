import 'package:agenda_contatos/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Agenda());
}

class Agenda extends StatelessWidget {
  const Agenda({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
