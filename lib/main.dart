import 'package:flutter/material.dart';
import 'package:language_call_app/mobile/my_app_mobile.dart'
    if (dart.library.html) 'package:language_call_app/web/my_app_web.dart'
    as myApp;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const myApp.MyApp());
}
