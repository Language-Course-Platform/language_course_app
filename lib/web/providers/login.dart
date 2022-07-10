import 'package:flutter/material.dart';

class Login extends ChangeNotifier {
  String? loginValue;
  String? get loginInfo => loginValue;

  String? passwordValue;
  String? get password => passwordValue;
  bool isAuthenticating = false;
  bool get isAuthenticated => isAuthenticating;

  String? errorValue;
  String? get error => errorValue;

  Map<String, dynamic>? toJson() {
    return {"username": loginInfo, "password": passwordValue};
  }

  void setLoginInfo(String? newValue) {
    loginValue = newValue;
    notifyListeners();
  }

  void setPassword(String? newValue) {
    passwordValue = newValue;
    notifyListeners();
  }

  void setError(String? newValue) {
    errorValue = newValue;
    notifyListeners();
  }

  void setAuthenticating(bool newValue) {
    isAuthenticating = newValue;
    notifyListeners();
  }

  clearForm() {
    setLoginInfo(null);
    setPassword(null);
  }

  clearAll() {
    clearForm();
    setError(null);
    setAuthenticating(false);
  }
}
