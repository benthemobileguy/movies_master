import 'package:flutter/material.dart';

class ApiException implements Exception {
  int code;
  String message;
  bool preventRedirect;
  BuildContext context;

  ApiException(
      {this.code,
        this.message,
        this.preventRedirect = false,
        @required this.context}) {
    print(code);
    switch (code) {
      case 573:
        break;
      default:
       //show alert dialog here
        break;
    }
  }
}

