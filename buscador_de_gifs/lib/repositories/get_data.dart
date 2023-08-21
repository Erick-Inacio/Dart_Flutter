import 'dart:convert';
import 'package:http/http.dart' as http;

int offSet = 0;

Future<Map> getGifs(String? search) async {
  int offSet = getOffSet();
  const trending =
      'https://api.giphy.com/v1/gifs/trending?api_key=HoyRsGaX6UGQAG7OT9AAN5avU4qJ1zjk&limit=20&offset=0&rating=g&bundle=messaging_non_clips';
  var searchGif =
      'https://api.giphy.com/v1/gifs/search?api_key=HoyRsGaX6UGQAG7OT9AAN5avU4qJ1zjk&q=$search&limit=19&offset=$offSet&rating=g&lang=pt&bundle=messaging_non_clips';

  http.Response response;

  if (search == null) {
    response = await http.get(Uri.parse(trending));
  } else {
    response = await http.get(Uri.parse(searchGif));
  }
  return json.decode(response.body);
}

void setOffSet(int value) {
  offSet = value;
}

int getOffSet() {
  return offSet;
}
