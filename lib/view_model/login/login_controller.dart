import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:mvvm/view/utils/routes/routes_name.dart';

import '../../view/utils/utils.dart';

class LoginController extends GetxController {
  final RxBool isLogging = false.obs;
  bool get loginStatus => isLogging.value;
  void changeLoginStatus() {
    isLogging.value = !isLogging.value;
    update();
  }

  void pressedLogin(BuildContext context, String email, String passcode) {
    changeLoginStatus();
    FocusManager.instance.primaryFocus?.unfocus();
    Future.delayed(const Duration(seconds: 3), () {
      if (email != "" && passcode.length >= 4) {
        Utils.showSnackbarFunction(context, SnackBarType.success, "Logged in");
        changeLoginStatus();
        Navigator.pushNamed(context, RoutesName.home);
      } else {
        if (email == "" && passcode.length > 3) {
          Utils.showSnackbarFunction(
              context, SnackBarType.error, "Please enter a valid email");
        } else if (email != "" && passcode.length < 4) {
          Utils.showSnackbarFunction(context, SnackBarType.error,
              "Password must be greater than 3 characters");
        } else {
          Utils.showSnackbarFunction(
              context, SnackBarType.error, "Check email or passcode");
        }
        changeLoginStatus();
      }
    });
  }
}
