import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as httpClient;
import 'api_exceptions.dart';
import 'urls.dart';

class ApiHelper {
  Future<dynamic> getAPI({required String url, Map<String, String>? params}) async {
    try {
      //  Correct way to append params + API key
      final uri = Uri.parse(url).replace(queryParameters: {
        ...?params,
        'apiKey': AppUrls.API_KEY,
      });

      print("🔗 API Request: $uri");

      final response = await httpClient.get(uri);

      return _returnJsonResponse(response);
    } on SocketException {
      throw FetchDataException(errorMsg: "No Internet Connection");
    }
  }

  dynamic _returnJsonResponse(httpClient.Response response) {
    print(" Response Status: ${response.statusCode}");
    print(" Response Body: ${response.body}");

    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(errorMsg: response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(errorMsg: "Unauthorized! Check your API key.");
      case 500:
      default:
        throw FetchDataException(
            errorMsg:
            "Error occurred while communicating with server. StatusCode: ${response.statusCode}");
    }
  }
}
