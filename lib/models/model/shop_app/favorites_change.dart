import 'package:flutter_application_3/main.dart';

class FavoritesChange {
  bool? status;
  String? message;

  FavoritesChange.formjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['meesage'];
  }
}
