import 'dart:convert';

class User {
  User.fromJson(Map<String, dynamic> json) {}

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
