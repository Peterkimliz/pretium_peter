import "dart:convert";

import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";

class DbBase {
  static const postRequest = "POST";
  static const getRequest = "GET";
  static const putRequest = "PUT";
  static const patchRequest = "PATCH";

  static databaseRequest(String url, String method,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String? token = sharedPreferences.getString("token");
      headers ??= {
        "Authorization": "Bearer ${token ?? ""}",
        "Content-Type": "application/json"
      };

      var request = http.Request(method, Uri.parse(url));
      request.headers.addAll(headers);
      print("url is ${url}");

      if (body != null) {
        request.body = json.encode(body);
      }
      http.StreamedResponse response = await request.send();
      return response.stream.bytesToString();
    } catch (e) {
      print("Error on api $url $e");
    }
  }
}
