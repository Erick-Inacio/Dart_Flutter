import 'package:agenda_melhorada/pages/agenda.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const AgendaHard(),
  );
}

class AgendaHard extends StatelessWidget {
  const AgendaHard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Agenda(),
    );
  }
}
