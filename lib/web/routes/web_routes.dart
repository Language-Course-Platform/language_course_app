import 'package:language_call_app/web/repository/user_repository.dart';
import 'package:language_call_app/web/ui/screens/auth/forgot_password/web_forgot_password.dart';
import 'package:language_call_app/web/ui/screens/auth/login/web_login.dart';
import 'package:language_call_app/web/ui/screens/auth/register/web_register.dart';
import 'package:language_call_app/web/ui/screens/landing/web_landing.dart';
import 'package:language_call_app/web/ui/screens/learn/web_learn.dart';
import 'package:language_call_app/web/ui/screens/learn/web_learn_by_id.dart';
import 'package:language_call_app/web/ui/screens/profile/edit/web_edit_profile.dart';
import 'package:language_call_app/web/ui/screens/profile/view/web_profile.dart';
import 'package:language_call_app/web/ui/screens/talk/web_talk.dart';
import 'package:qlevar_router/qlevar_router.dart';
import '../models/user.dart';
import '../ui/screens/error/web_error_screen.dart';
import '../ui/screens/home/web_home_screen.dart';
import '../ui/screens/talk/web_talk_select.dart';

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
        AuthMiddleware()
      ],
    ),
    QRoute(
      path: "/home",
      name: "Home",
      builder: () => const WebHomeScreen(),
      pageType: const QFadePage(
        opaque: true,
        transitionDurationMilliseconds: 1000,
        reverseTransitionDurationMilliseconds: 1000,
      ),
      middleware: [
        //AuthMiddleware2(),
      ],
    ),
    QRoute(
      path: "/login",
      name: "Login",
      builder: () => const WebLogin(),
      pageType: const QFadePage(
        opaque: true,
        transitionDurationMilliseconds: 1000,
        reverseTransitionDurationMilliseconds: 1000,
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
        reverseTransitionDurationMilliseconds: 1000,
      ),
    ),
    QRoute(
      path: "/forgot-password",
      name: "ForgotPassword",
      builder: () => const WebForgotPassword(),
      pageType: const QFadePage(
        opaque: true,
        transitionDurationMilliseconds: 1000,
        reverseTransitionDurationMilliseconds: 1000,
      ),
    ),
    QRoute(
      path: "/profile",
      builder: () => const WebProfile(),
      pageType: const QFadePage(
        opaque: true,
        transitionDurationMilliseconds: 1000,
        reverseTransitionDurationMilliseconds: 1000,
      ),
      children: [
        QRoute(
          path: "/:id",
          name: "profile",
          builder: () => const WebProfile(),
          pageType: const QFadePage(
            opaque: true,
            transitionDurationMilliseconds: 1000,
            reverseTransitionDurationMilliseconds: 1000,
          ),
        ),
      ],
      middleware: [
        InvalidRouteMiddleware(),
      ],
    ),
    QRoute.withChild(
      path: "/edit",
      name: "EditProfileRedirect",
      builderChild: (r) => const WebEditProfile(),
      pageType: const QFadePage(
        opaque: true,
        transitionDurationMilliseconds: 1000,
        reverseTransitionDurationMilliseconds: 1000,
      ),
      children: [
        QRoute(
          path: "/:id",
          name: "ProfileEdit",
          builder: () => const WebEditProfile(),
          pageType: const QFadePage(
            opaque: true,
            transitionDurationMilliseconds: 1000,
            reverseTransitionDurationMilliseconds: 1000,
          ),
        ),
      ],
      middleware: [
        InvalidRouteMiddleware(),
      ],
    ),
    QRoute.withChild(
      path: "/learn",
      name: "LearnLanguage",
      builderChild: (r) => const WebLearn(),
      pageType: const QFadePage(
        opaque: true,
        transitionDurationMilliseconds: 1000,
        reverseTransitionDurationMilliseconds: 1000,
      ),
      children: [
        QRoute(
          path: "/:id",
          name: "LearnById",
          builder: () => const WebLearnById(),
          pageType: const QFadePage(
            opaque: true,
            transitionDurationMilliseconds: 1000,
            reverseTransitionDurationMilliseconds: 1000,
          ),
        ),
      ],
      middleware: [
        InvalidRouteMiddleware(),
      ],
    ),
    QRoute.withChild(
      path: "/select",
      name: "SelectLanguage",
      builderChild: (r) => const WebTalkSelect(),
      pageType: const QFadePage(
        opaque: true,
        transitionDurationMilliseconds: 1000,
        reverseTransitionDurationMilliseconds: 1000,
      ),
      children: [
        QRoute(
          path: "/:languageId",
          name: "Talk",
          builder: () => const WebTalk(),
          pageType: const QFadePage(
            opaque: true,
            transitionDurationMilliseconds: 1000,
            reverseTransitionDurationMilliseconds: 1000,
          ),
        ),
      ],
      middleware: [
        InvalidRouteMiddleware(),
      ],
    ),
    QRoute(
      path: "/error",
      name: "error",
      builder: () => const WebErrorScreen(),
      pageType: const QFadePage(
        transitionDurationMilliseconds: 1000,
        reverseTransitionDurationMilliseconds: 1000,
      ),
    ),
  ];

  void initDefaultConfig() {
    QR.settings.enableDebugLog = false;
    QR.settings.enableLog = false;
    //QR.setUrlStrategy();
    QR.settings.initPage = const WebLanding();
    QR.settings.oneRouteInstancePerStack = true;
    QR.settings.notFoundPage = QRoute(
        path: "/error",
        name: "error",
        builder: () => const WebErrorScreen(),
        pageType: const QFadePage(
          transitionDurationMilliseconds: 1000,
        ));
  }
}

class AuthMiddleware extends QMiddleware {
  Future<User?> fetchUser() async =>
      await UserRepository().read(); // Get you Data storage

  @override
  Future<bool> canPop() async => await fetchUser() == null;
  @override
  Future<String?> redirectGuard(String path) async =>
      await fetchUser() == null ? null : '/home';
}

class AuthMiddleware2 extends QMiddleware {
  Future<User?> fetchUser() async =>
      await UserRepository().read(); // Get you Data storage

  @override
  Future<bool> canPop() async => await fetchUser() == null;
  @override
  Future<String?> redirectGuard(String path) async =>
      await fetchUser() == null ? "/" : null;
}

class InvalidRouteMiddleware extends QMiddleware {
  Future<User?> fetchUser() async =>
      await UserRepository().read(); // Get you Data storage

  @override
  Future<bool> canPop() async => await fetchUser() == null;
  @override
  Future<String?> redirectGuard(String path) async =>
      await fetchUser() == null ? "/error" : null;
}
