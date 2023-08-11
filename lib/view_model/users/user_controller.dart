import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvvm/networking/repository/user_repo.dart';

class UserController extends GetxController {
  final myRepo = UserRepository();
  final RxBool isLogging = false.obs;
  bool get loginStatus => isLogging.value;
  void changeLoginStatus() {
    isLogging.value = !isLogging.value;
    update();
  }

  Future<dynamic> fetchAllUsers(BuildContext context) async {
    await myRepo.fetchUsersApi().then((value) {
      return value;
    });
    return null;
  }
}
