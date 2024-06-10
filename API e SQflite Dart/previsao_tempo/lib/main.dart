import 'dart:io';
import 'package:via_cep/services/api/geocoding_api.dart';
import 'package:via_cep/services/api/weather_api.dart';

void main(List<String> arguments) async {
  double? lat;
  double? lon;

  print('Por favor insira o CEP: ');
  String? cep = stdin.readLineSync();

  // Obtendo dados do CEP
  if (cep != null && cep.isNotEmpty) {
    // Obtendo Latitude e Longitude
    try {
      Map<String, dynamic>? latLong = await GeocodingApi.getLongLat(cep);
      if (latLong.isNotEmpty) {
        var results = latLong['results'][0];
        lat = results['geometry']['lat'];
        lon = results['geometry']['lng'];
        print('Latitude: $lat, Longitude: $lon');
      } else {
        print('Nenhuma coordenada encontrada para o CEP fornecido.');
      }
    } catch (e) {
      print('Erro ao obter latitude e longitude: $e');
    }
  } else {
    print('CEP inválido.');
  }

  if (lat != null && lon != null) {
    try {
      await OpenWeatherApi.getWeather(lat, lon);
    } catch (e) {
      print('Erro ao obter clima: $e');
    }
  }
}
