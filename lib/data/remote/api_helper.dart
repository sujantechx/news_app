import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'api_exceptions.dart';

abstract class BaseApiClient {
  Future<dynamic> get({required String url, Map<String, String>? params});
}

class ApiClient implements BaseApiClient {
  final http.Client _httpClient;
  final _logger = Logger();
  //  API key is now a hardcoded constant.
  static const String _apiKey = '7ddfb94977084f56bb5241301a66e116';

  ApiClient({required http.Client httpClient}) : _httpClient = httpClient;

  @override
  Future<dynamic> get({required String url, Map<String, String>? params}) async {
    final uri = Uri.parse(url).replace(queryParameters: {
      ...?params,
      'apiKey': _apiKey, // Use the hardcoded key
    });

    _logger.i("🚀 API Request: $uri");

    try {
      final response = await _httpClient.get(uri).timeout(const Duration(seconds: 20));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw ApiNotRespondingException('API did not respond in time');
    }
  }

  dynamic _processResponse(http.Response response) {
    _logger.d("⬅️ API Response [${response.statusCode}]: ${response.body}");
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(_extractErrorMessage(response.body));
      case 401:
      case 403:
        throw UnauthorisedException(_extractErrorMessage(response.body));
      case 500:
      default:
        throw FetchDataException(
          'Error occurred with status code: ${response.statusCode}',
        );
    }
  }

  String _extractErrorMessage(String responseBody) {
    try {
      final body = jsonDecode(responseBody);
      return body['message'] ?? 'An unknown error occurred';
    } catch (_) {
      return responseBody;
    }
  }
}