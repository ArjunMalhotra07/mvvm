class AppException implements Exception {
  String? message;
  String? prefix;
  AppException({this.message, this.prefix});
  @override
  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends AppException {
  FetchDataException({String? message}) : super(message: "Error during Comms");
}

class BadRequestException extends AppException {
  BadRequestException({String? message}) : super(message: "Invalid Request");
}

class InvalidInputException extends AppException {
  InvalidInputException({String? message})
      : super(message: "Invalid Input Exception");
}
