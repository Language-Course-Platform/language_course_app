import 'package:language_call_app/web/repository/user_repository.dart';
import 'package:language_call_app/web/ui/screens/auth/forgot_password/web_forgot_password.dart';
import 'package:language_call_app/web/ui/screens/auth/login/web_login.dart';
import 'package:language_call_app/web/ui/screens/auth/register/web_register.dart';
import 'package:language_call_app/web/ui/screens/landing/web_landing.dart';
import 'package:qlevar_router/qlevar_router.dart';
import '../models/User.dart';
import '../ui/screens/home/web_home_screen.dart';

class WebRoutes {
  final routes = [
    QRoute(
        path: "/",
        name: "Landing",
        builder: () => const WebLanding(),
        pageType: const QFadePage(
          opaque: true,
          transitionDurationMilliseconds: 1000,
          reverseTransitionDurationMilliseconds: 1000,
        ),
        middleware: [
          /*  QMiddlewareBuilder(
            redirectGuardFunc: (p0) {
              return Future.delayed(const Duration(seconds: 0), () {
                return "/login";
              });
            },
          ) */
          // AuthMiddleware()
        ]),
    QRoute(
      path: "/home",
      name: "Home",
      builder: () => const WebHomeScreen(),
      pageType: const QFadePage(
        opaque: true,
        transitionDurationMilliseconds: 1000,
        //reverseTransitionDurationMilliseconds: 1000,
      ),
      /*middleware: [
          QMiddlewareBuilder(
            redirectGuardFunc: (p0) {
              return Future.delayed(const Duration(seconds: 0), () {
                return "/";
              });
            },
          )
        ]*/
    ),
    QRoute(
      path: "/login",
      name: "Login",
      builder: () => const WebLogin(),
      pageType: const QFadePage(
        opaque: true,
        transitionDurationMilliseconds: 1000,
        // reverseTransitionDurationMilliseconds: 1000,
      ),
      /*  middleware: [
        AuthMiddleware(),
      ], */
    ),
    QRoute(
      path: "/register",
      name: "Register",
      builder: () => const WebRegister(),
      pageType: const QFadePage(
        opaque: true,
        transitionDurationMilliseconds: 1000,
        //reverseTransitionDurationMilliseconds: 1000,
      ),
    ),
    QRoute(
      path: "/forgot-password",
      name: "ForgotPassword",
      builder: () => const WebForgotPassword(),
      pageType: const QFadePage(
        opaque: true,
        transitionDurationMilliseconds: 1000,
        // reverseTransitionDurationMilliseconds: 1000,
      ),
    ),
  ];
}

class AuthMiddleware extends QMiddleware {
  Future<User?> fetchUser() async =>
      await UserRepository().read(); // Get you Data storage

  @override
  Future<bool> canPop() async => await fetchUser() == null;
  @override
  Future<String?> redirectGuard(String path) async =>
      await fetchUser() == null ? "/" : '/home';
}
