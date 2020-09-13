import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({this.url});
  String url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var requestUrl = response.request.url;
      print('request url: $requestUrl');

      String data = response.body;
      var decodedData = jsonDecode(data);
      print(decodedData);
      return decodedData;

      String city = decodedData['name'];
      double temperature = decodedData['main']['temp'];
      String description = decodedData['weather'][0]['description'];
      int condition = decodedData['weather'][0]['id'];

      print('city = $city');
      print('temperature = $temperature');
      print('description = $description');
      print('condition = $condition');
    } else {
      print('statusCode = ${response.statusCode}');
    }
  }
}
