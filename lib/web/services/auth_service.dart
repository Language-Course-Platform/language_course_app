import 'dart:convert';
import 'package:language_call_app/web/services/default_service.dart';

class AuthService extends DefaultService {
  Future<Map<String, dynamic>?> login(Map<dynamic, dynamic>? body) async {
    String url = "https://${DefaultService.envUrl}/login";

    try {
      final response = await super.post(url, body: body);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return {
          "statusCode": response.statusCode,
          "result":
              const Utf8Codec(allowMalformed: true).decode(response.bodyBytes),
        };
      } else {
        return {
          "statusCode": response.statusCode,
          "error": jsonDecode(
            const Utf8Codec(allowMalformed: true).decode(response.bodyBytes),
          )
        };
      }
    } catch (e) {
      return Future.error("Sorry, we have problem with our servers");
    }
  }

  Future<Map<String, dynamic>?> register(Map<dynamic, dynamic>? body) async {
    String url = "https://${DefaultService.envUrl}/register";

    try {
      final response = await post(url, body: body);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return {
          "statusCode": response.statusCode,
          "result":
              const Utf8Codec(allowMalformed: true).decode(response.bodyBytes),
        };
      } else {
        return {
          "statusCode": response.statusCode,
          "error": jsonDecode(
            const Utf8Codec(allowMalformed: true).decode(response.bodyBytes),
          )
        };
      }
    } catch (e) {
      return Future.error("Sorry, we have problem with our servers");
    }
  }
}
