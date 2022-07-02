import 'package:flutter/material.dart';

class Register extends ChangeNotifier {
  String? usernameValue;
  String? get username => usernameValue;
  String? emailValue;
  String? get email => emailValue;

  String? passwordValue;
  String? get password => passwordValue;
  bool isRegistering = false;
  bool get isRegistered => isRegistering;

  String? errorValue;
  String? get error => errorValue;

  void setUsername(String? newValue) {
    usernameValue = newValue;
    notifyListeners();
  }

  void setError(String? newValue) {
    errorValue = newValue;
    notifyListeners();
  }

  void setEmail(String? newValue) {
    emailValue = newValue;
    notifyListeners();
  }

  void setPassword(String? newValue) {
    passwordValue = newValue;
    notifyListeners();
  }

  void setRegistering(bool newValue) {
    isRegistering = newValue;
    notifyListeners();
  }

  clearForm() {
    setEmail(null);
    setPassword(null);
    setUsername(null);
  }

  clearAll() {
    clearForm();
    setRegistering(false);
    setError(null);
  }
}
