// lib/data/remote/api_constants.dart

class ApiConstants {
  // Private constructor to prevent instantiation
  ApiConstants._();

  static const String BASE_URL = "https://newsapi.org/v2";
  static const String TOP_HEADLINES_URL = "$BASE_URL/top-headlines";
  static const String EVERYTHING_URL = "$BASE_URL/everything";
}