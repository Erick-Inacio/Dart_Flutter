import 'package:http/http.dart' as http;
import 'dart:convert';

class OpenWeatherApi {
  static Future<void> getWeather(double lat, double lon) async {
    String apiKey = 'cca26109325f478ebbe165127240906';
    String url =
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$lat,$lon&days=2&aqi=no&alerts=no&lang=pt';

    try {
      final response = await http.get(Uri.parse(url));
      // print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        print('\nClima: ${data['current']['condition']['text']}');
        print('Temperatura: ${data['current']['temp_c']}°C');
        print('Sensação Térmica: ${data['current']['temp_c']}ºC');
      } else {
        print('Erro ao buscar dados: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro: $e');
    }
  }
}
