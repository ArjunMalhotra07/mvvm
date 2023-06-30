import 'package:mvvm/networking/data/response/status.dart';

class ApiResponse<T> {
  Status? apiStatus;
  T? data;
  String? message;
  ApiResponse(this.apiStatus, this.data, this.message);
  ApiResponse.loading() : apiStatus = Status.loading;
  ApiResponse.completed() : apiStatus = Status.completed;
  ApiResponse.error() : apiStatus = Status.error;
  @override
  String toString() {
    return "Status $apiStatus\nMessage $message\nData $data";
  }
}
