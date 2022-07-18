import 'dart:convert';

import 'package:language_call_app/web/models/languages.dart';

import 'address.dart';
import 'billing.dart';

class User {
  int? id;
  String? username;
  String? firstname;
  String? lastname;
  String? birthday;
  String? phone;
  String? avatarUrl;
  double? credits;
  Address? address;
  Billing? billing;
  Languages? languages;

  User({
    this.id,
    this.firstname,
    this.username,
    this.lastname,
    this.address,
    this.avatarUrl,
    this.birthday,
    this.credits,
    this.phone,
    this.billing,
    this.languages
  });

  User.fromJson(Map<String, dynamic> json) {
    if (json["id"] != null) {
      id = int.tryParse(json["id"]);
    }
    if (json["username"] != null) {
      id = json["username"];
    }
    if (json["firstname"] != null) {
      id = json["firstname"];
    }
    if (json["lastname"] != null) {
      id = json["lastname"];
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data;
  }

  static List<User> parseJsonToList(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  static String parseListToJson(List<User> userList) {
    return jsonEncode(userList.map((e) => e.toJson()).toList());
  }
}
