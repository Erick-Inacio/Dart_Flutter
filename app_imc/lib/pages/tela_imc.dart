import 'dart:math';

import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  TextEditingController weightControl = TextEditingController();
  TextEditingController heightControl = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String infoText = 'Informe seus dados';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                resetField();
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.person_outline,
                size: 120,
                color: Colors.green,
              ),
              TextFormField(
                controller: weightControl,
                validator: (value) {
                  if (weightControl.text.isEmpty) {
                    return 'Insira seu Peso';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                ),
              ),
              TextFormField(
                controller: heightControl,
                validator: (value) {
                  if (heightControl.text.isEmpty) {
                    return 'Insira sua altura';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Altura (m)",
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        infoText = 'Informe seus dados';
                        calculate();
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromHeight(50),
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    'Calcular',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Text(
                infoText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void resetField() {
    weightControl.clear();
    heightControl.clear();
    infoText = 'Informe seus dados';
    _formKey = GlobalKey<FormState>();
  }

  // ignore: curly_braces_in_flow_control_structures
  void calculate() {
    double weight = double.parse(weightControl.text);
    double height = double.parse(heightControl.text);
    double imc = (weight / pow(height, 2));

    if (imc < 18) {
      infoText = 'Abaixo do peso (${imc.toStringAsPrecision(3)})';
    } else if (imc <= 24.9) {
      infoText = 'Peso normal (${imc.toStringAsPrecision(3)})';
    } else if (imc <= 29.9) {
      infoText = 'Acima do Peso (${imc.toStringAsPrecision(3)})';
    } else if (imc <= 34.9) {
      infoText = 'Obesidade I (${imc.toStringAsPrecision(3)})';
    } else if (imc <= 39.9) {
      infoText = 'Obesidade II Peso (${imc.toStringAsPrecision(3)})';
    } else if (imc >= 40) {
      infoText = 'Obesidade III (${imc.toStringAsPrecision(3)})';
    }
  }
}
