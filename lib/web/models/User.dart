import 'dart:convert';

import 'address.dart';

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
  });
  User.fromJson(Map<String, dynamic> json);

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
