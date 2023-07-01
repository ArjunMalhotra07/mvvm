import 'package:mvvm/networking/data/network/app_url.dart';
import 'package:mvvm/networking/data/network/baseApiService.dart';
import 'package:mvvm/networking/data/network/networkApiService.dart';

class AuthRepository {
  final BaseApiService _service = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _service.getPostAPIResponse(AppUrl.logIn, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic response = await _service.getPostAPIResponse(AppUrl.signIn, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
