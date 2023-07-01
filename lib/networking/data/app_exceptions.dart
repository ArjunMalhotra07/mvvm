class AppException implements Exception {
  String? message;
  String? prefix;
  AppException({this.message, this.prefix});
  @override
  String toString() {
    return "$message : $prefix";
  }
}

class FetchDataException extends AppException {
  FetchDataException({String? message}) : super(message: "Error during Comms");
}

class BadRequestException extends AppException {
  BadRequestException({String? message})
      : super(message: "Invalid Request", prefix: message);
}

class PageNotFoundException extends AppException {
  PageNotFoundException({String? message}) : super(message: "Page Not found");
}

class InvalidInputException extends AppException {
  InvalidInputException({String? message})
      : super(message: "Invalid Input Exception");
}
