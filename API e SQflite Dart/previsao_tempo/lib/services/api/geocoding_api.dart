import 'dart:convert';
import 'package:http/http.dart' as http;

class GeocodingApi {
  
  static Future<Map<String, dynamic>> getLongLat(String cep) async {
    String apiKey = '0cd38d9288c641dfb86e22d883452923';
    String url =
        'https://api.opencagedata.com/geocode/v1/json?q=$cep&country_code=br&language=pt-br&key=$apiKey';

    Map<String, dynamic> data = {};

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          // print(data.toString());
          print('\nLocal: ${data['results'][0]['formatted']}');
        } else {
          print('Nenhum dado encontrado para o CEP fornecido.');
        }
      } else {
        print('Erro ao buscar dados: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro: $e');
    }
    return data;
  }
}
