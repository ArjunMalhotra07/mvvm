import 'package:mvvm/networking/data/network/network_api_service.dart';

import '../../view_model/model/user_model.dart';
import '../data/network/app_url.dart';
import '../data/network/base_api_service.dart';

class UserRepository {
  final BaseApiService _service = NetworkApiService();

  Future<Users> fetchUsersApi() async {
    try {
      dynamic response = await _service.getGetAPIResponse(AppUrl.fetchUsers);
      return Users.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
