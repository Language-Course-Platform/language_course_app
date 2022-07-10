import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:language_call_app/web/providers/login.dart';
import 'package:language_call_app/web/providers/register.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'web/routes/web_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(kIsWeb ? const MyAppWeb() : const MyApp());
}

class MyAppWeb extends StatelessWidget {
  const MyAppWeb({Key? key}) : super(key: key);
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
      ],
      child: MaterialApp.router(
        routerDelegate: QRouterDelegate(routes.routes, withWebBar: true),
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
