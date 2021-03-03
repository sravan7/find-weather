import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  Network({@required this.url});
  final String url;
  Future getWeatherFromApi() async {
    try {
      http.Response response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // print('Response body: ${response.body}');
        String data = response.body;
        return jsonDecode(data);
      } else {
        print('Response status: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
}
