import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../view/utils/utils.dart';

class LoginController extends GetxController {
  void pressedLogin(BuildContext context, String email, String passcode) {
    if (email != "" && passcode.length >= 4) {
      Utils.showSnackbarFunction(context, SnackBarType.success, "Logged in");
    } else {
      if (email == "" && passcode.length > 5) {
        Utils.showSnackbarFunction(
            context, SnackBarType.error, "Please enter a valid email");
      } else if (email != "" && passcode.length < 3) {
        Utils.showSnackbarFunction(context, SnackBarType.error,
            "Password must be greater than 3 characters");
      } else {
        Utils.showSnackbarFunction(
            context, SnackBarType.error, "Check email or passcode");
      }
    }
  }
}
