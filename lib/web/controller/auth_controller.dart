import 'package:flutter/material.dart';
import 'package:language_call_app/web/services/auth_service.dart';

class AuthController extends AuthService {
  /* older way 
    AuthService? _authService;
    AuthController({this.context}){
      _authService = AuthService()
    }
  final BuildContext? context;
   */

  AuthController({this.context});
  final BuildContext? context;

  @override
  Future<void> login(Map<dynamic, dynamic>? body) async {
    await super.login(body);
  }
}
