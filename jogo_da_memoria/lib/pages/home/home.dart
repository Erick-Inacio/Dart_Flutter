import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/classes/palette.dart';
import 'package:jogo_da_memoria/pages/home/players_input.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Palette.purple3,
        title: Text(
          'Jogo da Memória',
          style: TextStyle(
            color: Palette.purpleClear,
            fontWeight: FontWeight.w500,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              onPressed: () {
                setState(() {
                  int numPlayers = int.parse(numPlayerControll.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayersInput(
                        numPlayers: numPlayers,
                      ),
                    ),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
