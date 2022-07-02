import 'package:language_call_app/web/services/default_service.dart';

class AuthService extends DefaultService {
  Future<void> login(Map<dynamic, dynamic>? body) async {
    String url = "https://localhost:8080/login";

    try {
      final response = await super.post(url, body: body);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
      } else {}
    } on Exception catch (e) {
      return Future.error("Sorry, we have problem with our servers: $e ");
    }
  }

  Future<void> register(Map<dynamic, dynamic>? body) async {
    String url = "https://localhost:8080/login";

    try {
      final response = await post(url, body: body);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
      } else {}

      // ignore: empty_catches, unused_catch_clause
    } on Exception catch (e) {
      return Future.error("Sorry, we have problem with our servers: $e");
    }
  }
}
