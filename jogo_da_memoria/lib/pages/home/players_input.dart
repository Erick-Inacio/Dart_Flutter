import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/classes/palette.dart';
import 'package:jogo_da_memoria/widgets/button.dart';
import 'package:jogo_da_memoria/widgets/field_text.dart';

class PlayersInput extends StatefulWidget {
  const PlayersInput({super.key, required this.numPlayers});

  final int numPlayers;

  @override
  State<PlayersInput> createState() => _PlayersInputState();
}

class _PlayersInputState extends State<PlayersInput> {
  int numJog = 1;

  TextEditingController nameControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(
              controller: nameControl,
              text: 'Nome do player $numJog',
            ),
            MyButton(
              text: 'Próximo',
              onPressed: () {
                setState(() {
                  for(int i = 1; i <= widget.numPlayers; i++){
                    Player widget.numPlayer = Player
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
  List<Player> players(){

  }
}
