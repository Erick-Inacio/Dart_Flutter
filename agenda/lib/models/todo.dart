import 'package:flutter/material.dart';

import '../classes/cores_pink.dart';

class Todo {
  Todo({
    required this.title,
    required this.dateTime,
    this.cor = Cores.pink,
  });

  Todo.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        dateTime = DateTime.parse(json['dateTime']),
        cor = _colorFromJson(json['cor']);

  String title;
  DateTime dateTime;
  Color cor;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'dateTime': dateTime.toIso8601String(),
      'cor': _colorToJson(cor),
    };
  }

  static Color _colorFromJson(dynamic json) {
    // Verifica se o valor é uma string
    if (json is String) {
      // Converte a string para uma lista de inteiros
      List<int> rgba = json
          .replaceAll('Color(', '')
          .replaceAll('Color(', '')
          .replaceAll(')', '')
          .split(',')
          .map(int.parse)
          .toList();

      // Retorna uma instância de Color com os valores obtidos
      return Color.fromARGB(rgba[3], rgba[0], rgba[1], rgba[2]);
    }
    // Retorna uma cor padrão caso o valor seja inválido
    return Colors.transparent;
  }

  static String _colorToJson(Color color) {
    // Retorna uma string com a representação da cor
    return 'Color(${color.red},${color.green},${color.blue},${color.alpha})';
  }
}
