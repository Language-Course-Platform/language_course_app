import 'package:flutter/material.dart';
import 'package:language_call_app/web/services/auth_service.dart';

class AuthController {
  /* older way 
    AuthService? _authService;
    AuthController({this.context}){
      _authService = AuthService()
    }
  final BuildContext? context;
   */
  AuthService? _authService;
  AuthController({this.context}) {
    _authService = AuthService();
  }
  final BuildContext? context;

  Future<void> login(Map<dynamic, dynamic>? body) async {
    await _authService?.login(body);
  }

  Future<void> register(Map<dynamic, dynamic>? body) async {
    print(body);
    await _authService?.register(body);
  }
}
