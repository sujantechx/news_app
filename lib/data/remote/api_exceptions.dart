class ApiExceptions implements Exception {
  final String title;
  final String msg;

  ApiExceptions({required this.title, required this.msg});

  String toErrorMsg() {
    return "$title: $msg";
  }
}

class FetchDataException extends ApiExceptions {
  FetchDataException({required String errorMsg})
      : super(title: "Network Error", msg: errorMsg);
}

class BadRequestException extends ApiExceptions {
  BadRequestException({required String errorMsg})
      : super(title: "Invalid Request", msg: errorMsg);
}

class UnauthorisedException extends ApiExceptions {
  UnauthorisedException({required String errorMsg})
      : super(title: "Unauthorised", msg: errorMsg);
}

class InvalidInputException extends ApiExceptions {
  InvalidInputException({required String errorMsg})
      : super(title: "Invalid Input", msg: errorMsg);
}
