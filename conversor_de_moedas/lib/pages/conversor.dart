import 'package:conversor_de_moedas/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:conversor_de_moedas/functions/get_data.dart';

class Conversor extends StatefulWidget {
  const Conversor({super.key});

  @override
  State<Conversor> createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  double? dolar;
  double? euro;

  TextEditingController realControl = TextEditingController();
  TextEditingController dolarControl = TextEditingController();
  TextEditingController euroControl = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('\$ Conversor \$'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          try {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: Text(
                    'Carregando Dados',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              default:

                // Renderizar o conteúdo quando a conexão for bem-sucedida
                dolar = snapshot.data?["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data?["results"]["currencies"]["EUR"]["buy"];
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const Icon(
                          Icons.monetization_on,
                          size: 150,
                          color: Colors.amber,
                        ),
                        const Divider(),
                        MyTextField(
                          //formKey: _formKey,
                          label: 'Reais',
                          prefix: 'R\$',
                          control: realControl,
                          function: realChanged,
                        ),
                        const Divider(),
                        MyTextField(
                          //formKey: _formKey,
                          label: 'Dólar',
                          prefix: '\$',
                          control: dolarControl,
                          function: dolarChanged,
                        ),
                        const Divider(),
                        MyTextField(
                          //formKey: _formKey,
                          label: 'Euro',
                          prefix: '€',
                          control: euroControl,
                          function: dolarChanged,
                        ),
                      ],
                    ),
                  ),
                );
            }
          } catch (e) {
            print('Erro: $e');
            return Center(
              child: Text(
                'Erro: $e',
                style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }
        },
      ),
    );
  }

  void realChanged(String text) {
    if (text.isEmpty) {
      clearFields();
      return;
    }

    double? real = double.tryParse(text);
    if (real == null) {
      clearFields();
      return;
    }

    dolarControl.text = (real / dolar!).toStringAsFixed(2);
    euroControl.text = (real / euro!).toStringAsFixed(2);
  }

  void dolarChanged(String text) {
    if (text.isEmpty) {
      clearFields();
      return;
    }

    double? dolar = double.tryParse(text);
    if (dolar == null) {
      clearFields();
      return;
    }

    realControl.text = (dolar * this.dolar!).toStringAsFixed(2);
    euroControl.text = (dolar * this.dolar! / euro!).toStringAsFixed(2);
  }

  void euroChanged(String text) {
    if (text.isEmpty) {
      clearFields();
      return;
    }

    double? euro = double.tryParse(text);
    if (euro == null) {
      clearFields();
      return;
    }
    realControl.text = (euro * this.euro!).toStringAsFixed(2);
    dolarControl.text = (euro * this.euro! / dolar!).toStringAsFixed(2);
  }

  void clearFields() {
    realControl.clear();
    dolarControl.clear();
    euroControl.clear();
  }
}
