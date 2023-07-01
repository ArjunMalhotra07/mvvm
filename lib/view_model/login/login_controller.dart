import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:mvvm/networking/repository/auth_repo.dart';
import 'package:mvvm/view/utils/routes/routes_name.dart';

import '../../view/utils/utils.dart';

class LoginController extends GetxController {
  final myRepo = AuthRepository();
  final RxBool isLogging = false.obs;
  bool get loginStatus => isLogging.value;
  void changeLoginStatus() {
    isLogging.value = !isLogging.value;
    update();
  }

  Future<void> pressedLogin(
      BuildContext context, String email, String passcode) async {
    changeLoginStatus();
    FocusManager.instance.primaryFocus?.unfocus();
    Map<String, dynamic> dataToSend = {"email": email, "password": passcode};
    if (email != "" && passcode.length >= 4) {
      await myRepo.loginApi(json.encode(dataToSend)).then((value) {
        if (context.mounted) {
          Utils.showSnackbarFunction(
              context, SnackBarType.success, "Logged in");
        }
        changeLoginStatus();
        if (context.mounted) {
          Navigator.pushNamed(context, RoutesName.home);
        }
      }).onError((error, stackTrace) {
        if (context.mounted) {
          Utils.showSnackbarFunction(
              context, SnackBarType.error, error.toString());
        }
        changeLoginStatus();
      });
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
  }
}
