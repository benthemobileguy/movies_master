import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movie_app/data/network/api-exception.dart';

class ApiService {
  BuildContext context;

  ApiService({@required this.context}) {
    print('Api service is called ');
  }

  Future<Map<String, dynamic>> get(String url) async {
    String baseUrl = dotenv.env['API_BASE_URL'];
    print(baseUrl + url);

    http.Response response =
    await http.get(Uri.parse(baseUrl + url),);
    final responseJson = json.decode(response.body);
    print(responseJson.toString());
    int statusCode = response.statusCode;
    print(response.toString());
    switch (statusCode) {
      case 200:
      case 201:
      Map<String, dynamic> data = json.decode(response.body);
        return data;
        break;
      default:
        dynamic data = json.decode(response.body);

        String msg;
        // lord knows why this was encoded twice
        if (data is String) {
          data = json.decode(data);
          msg = "";
          if (data.values
              .toList()
              .length > 0) {
            // show first error
            msg = data.values
                .toList()
                .first[0];
          }
        } else {
          msg = data['message'];
        }
        throw ApiException(
          context: context,
          message: msg,
          code: statusCode,
        );
        break;
    }
  }
}
