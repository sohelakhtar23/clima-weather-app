import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String url;
  NetworkHelper({required this.url});

  Future<dynamic> getData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
