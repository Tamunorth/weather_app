import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        Map decodedData = convert.jsonDecode(response.body);
        return decodedData;
      } catch (e) {
        print(e);
      }
    } else {
      print(response.statusCode);
    }
  }
}
