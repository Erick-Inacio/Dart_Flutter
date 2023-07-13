import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const request = "https://api.hgbrasil.com/finance?key=f0159d19";

Future<Map> getData() async {
  //print('Making HTTP request');
  http.Response response = await http.get(Uri.parse(request));
  //print('Received response: ${response.body}');
  return json.decode(response.body);
}
