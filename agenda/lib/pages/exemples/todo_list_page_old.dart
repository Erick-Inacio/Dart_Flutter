import 'package:flutter/material.dart';

const MaterialColor color = Colors.purple;
final TextEditingController emailControl = TextEditingController();

class ToDoListPage extends StatelessWidget {
  const ToDoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Scaffold é um widget padrão para iniciar uma tela
    return Scaffold(
      //Center é usado para centralizar ao meio vertical e horizontalmente os widgets na tela
      body: Center(
        //Padding é utilizado para arrumar margens no projeto
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          //TextField é utilizado para criar o campo de texto na tela
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                /* //InputDecoration é para estilizar o TextField
                decoration: InputDecoration(
                  labelText: 'Preço',
                  hintText: 'example@example.com',
                  hintStyle: TextStyle(color: color),
                  //border: InputBorder.none,
                  errorText: null,
                  suffixText: 'cm',
                  suffixStyle: TextStyle(
                    color: color,
                  ),
                  prefixText: 'R\$ ',
                  prefixStyle: TextStyle(
                    color: color,
                  ),
                  labelStyle: TextStyle(
                    color: color,
                  ),
                ),
                //obscureText é usado para tornar senhas invisíveis
                //obscureText: true,
                //obscuringCharacter é usado para especificar o caracter q será mosttrado na senha oculta
                //obscuringCharacter: 'x',
                //keyboardType serve para adaptar o teclado ao campo para melhor ux
                keyboardType: TextInputType.emailAddress,
                //TextStyle é utilizado para estilizar o texto
                style: TextStyle(
                  fontSize: 18,
                  //fontWeight: FontWeight.w700,
                  color: color,
                ),*/
                controller: emailControl,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
                onChanged: onChanged,
                onSubmitted: onSubmitted,
              ),
              ElevatedButton(
                onPressed: (){},
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*utilizando o TextEditingController para controlar o texto, sendo o unico que
   consigo alterar o texto*/
  //void login() {
    //String text = emailControl.text;
    //print(text);
  //}

  /*Unico que consigo validar a cada alteração feita no campo*/
  void onChanged(String text) {
    //print(text);
  }

  /*apenas altera quando clico em algum botão para slavar o texto*/
  void onSubmitted(String text) {
    //print(text);
  }
}
