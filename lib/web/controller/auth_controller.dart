import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:language_call_app/web/models/User.dart';
import 'package:language_call_app/web/providers/login.dart';
import 'package:language_call_app/web/providers/register.dart';
import 'package:language_call_app/web/repository/user_repository.dart';
import 'package:language_call_app/web/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

class AuthController {
  AuthService? _authService;
  AuthController({this.context}) {
    _authService = AuthService();
  }
  final BuildContext? context;

  Future<void> login(Map<dynamic, dynamic>? body) async {
    Login login = context!.read<Login>();
    final response = await _authService?.login(body);
    UserRepository userRepo = UserRepository();
    login.setAuthenticating(true);
    if (response?["statusCode"] >= 200 && response?["statusCode"] <= 299) {
      Future.delayed(const Duration(seconds: 5), () {
        login.setError(null);
        login.clearAll();
      });
      var user = User.fromJson(response?["result"]);
      await userRepo.saveUser(jsonEncode(user.toJson()));
      QR.toName("home");
    } else {
      Future.delayed(const Duration(seconds: 5), () {
        login.setError(response?["error"]);
        login.setAuthenticating(false);
      });
      return Future.error(login.error!);
    }
  }

  Future<void> register(Map<dynamic, dynamic>? body) async {
    Register register = context!.read<Register>();
    final response = await _authService?.register(body);
    register.setRegistering(true);

    if (response?["statusCode"] >= 200 && response?["statusCode"] <= 299) {
      register.setRegistering(false);
      register.clearAll();
    } else {
      register.setError(response?["error"]);
      register.setRegistering(false);
      return Future.error(register.error!);
    }
  }
}
