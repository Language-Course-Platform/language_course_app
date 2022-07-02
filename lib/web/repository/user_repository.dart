import 'dart:convert';

import 'package:language_call_app/web/data/db.dart';

import '../models/user.dart';

class UserRepository {
  Future<void> saveUser(String jsonData) async {
    await DB.save(jsonData, "user");
  }

  Future<User?> read() async {
    var userFromJson = await DB.getByKey('user');
    if (userFromJson == null || userFromJson == '') return null;
    return User.fromJson(jsonDecode(userFromJson));
  }

  Future<void> delete() async {
    await DB.delete("user");
  }
}
