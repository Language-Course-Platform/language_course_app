import 'package:flutter/material.dart';

class Forgot extends ChangeNotifier {
  String? emailValue;
  String? get email => emailValue;
  bool? isSending;
  bool? get emailsSent => isSending;

  void setEmailRecover(String? newValue) {
    emailValue = newValue;
    notifyListeners();
  }

  void setSent(bool? newValue) {
    isSending = newValue;
    notifyListeners();
  }

  clear() {
    setEmailRecover(null);
    setSent(null);
  }
}
