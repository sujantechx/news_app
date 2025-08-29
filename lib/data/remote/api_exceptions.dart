// lib/data/remote/api_exceptions.dart

class ApiException implements Exception {
  final String _prefix;
  final String _message;

  ApiException(this._prefix, this._message);

  @override
  String toString() {
    return "$_prefix: $_message";
  }
}

class FetchDataException extends ApiException {
  FetchDataException(String message) : super("Network Error", message);
}

class BadRequestException extends ApiException {
  BadRequestException(String message) : super("Invalid Request", message);
}

class UnauthorisedException extends ApiException {
  UnauthorisedException(String message) : super("Unauthorised", message);
}

class ApiNotRespondingException extends ApiException {
  ApiNotRespondingException(String message) : super("API Not Responding", message);
}