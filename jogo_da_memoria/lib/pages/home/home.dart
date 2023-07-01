import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:jogo_da_memoria/classes/palette.dart';
import 'package:jogo_da_memoria/widgets/button.dart';
import 'package:jogo_da_memoria/widgets/field_text.dart';

class Jogadores extends StatefulWidget {
  const Jogadores({super.key});

  @override
  State<Jogadores> createState() => _JogadoresState();
}

class _JogadoresState extends State<Jogadores> {
  var numPlayerControll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Palette.purple2),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyTextField(
                  controller: numPlayerControll,
                  text: 'Número de Jogadores',
                  teclado: TextInputType.number,
                ),
                const SizedBox(
                  height: 50,
                ),
                MyButton(
                  text: 'Próximo',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
