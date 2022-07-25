import 'package:flutter/material.dart';
import 'package:language_call_app/web/providers/forgot.dart';
import 'package:language_call_app/web/providers/login.dart';
import 'package:language_call_app/web/providers/register.dart';
import 'package:language_call_app/web/routes/web_routes.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final routes = WebRoutes();
    routes.initDefaultConfig();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Login(),
        ),
        ChangeNotifierProvider(
          create: (context) => Register(),
        ),
        ChangeNotifierProvider(
          create: (context) => Forgot(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(primaryColor: const Color(0xff1a1a40)),
        routerDelegate: QRouterDelegate(routes.routes, withWebBar: true),
        routeInformationParser: const QRouteInformationParser(),
        title: 'Ttile to define',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
