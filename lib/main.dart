import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:language_call_app/web/providers/login.dart';
import 'package:language_call_app/web/providers/register.dart';
import 'package:language_call_app/web/ui/screens/home/web_home_screen.dart';
import 'package:language_call_app/web/ui/screens/landing/web_landing.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

import 'web/routes/web_routes.dart';
import 'web/ui/screens/error/web_error_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDefaultConfig();
  runApp(kIsWeb ? const MyAppWeb() : const MyApp());
}

void initDefaultConfig() {
  QR.settings.enableDebugLog = true;
  QR.settings.enableLog = true;
  QR.setUrlStrategy();
  QR.settings.iniPage = const WebLanding();
  QR.settings.notFoundPage = QRoute(
      path: "/error",
      name: "error",
      builder: () => const WebErrorScreen(),
      pageType: const QFadePage(
        transitionDurationMilliseconds: 1000,
      ));
}

class MyAppWeb extends StatelessWidget {
  const MyAppWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Login(),
        ),
        ChangeNotifierProvider(
          create: (context) => Register(),
        ),
      ],
      child: MaterialApp.router(
        routerDelegate: QRouterDelegate(WebRoutes().routes, withWebBar: true),
        routeInformationParser: const QRouteInformationParser(),
        title: 'Ttile to define',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ttile to define',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
