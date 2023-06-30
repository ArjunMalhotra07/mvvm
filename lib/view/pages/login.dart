import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:mvvm/view/resources/components/round_button.dart';
import 'package:mvvm/view_model/login/login_controller.dart';

import '../utils/utils.dart';

class LoginPage extends HookWidget {
  LoginPage({super.key});
  final ValueNotifier<bool> obscurePasscode = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = useTextEditingController();
    final TextEditingController passcode = useTextEditingController();
    final loginController = Get.put(LoginController());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Login"),
        ),
        body: SizedBox(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: email,
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: "Email",
                      focusedBorder: OutlineInputBorder(
                        borderSide: Utils.giveBorder(Colors.blue, width: 2.0),
                        borderRadius: Utils.giveRadius(radius: 10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: Utils.giveBorder(Colors.grey, width: 2.0),
                        borderRadius: Utils.giveRadius(radius: 10),
                      )),
                ),
                const SizedBox(height: 30),
                ValueListenableBuilder(
                    valueListenable: obscurePasscode,
                    builder: ((context, value, child) {
                      return TextFormField(
                        controller: passcode,
                        obscureText: obscurePasscode.value,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            hintText: "Passcode",
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  obscurePasscode.value =
                                      !obscurePasscode.value;
                                },
                                child: obscurePasscode.value
                                    ? const Icon(Icons.visibility_off_outlined)
                                    : const Icon(Icons.visibility_outlined)),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  Utils.giveBorder(Colors.grey, width: 2.0),
                              borderRadius: Utils.giveRadius(radius: 10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  Utils.giveBorder(Colors.blue, width: 2.0),
                              borderRadius: Utils.giveRadius(radius: 10),
                            )),
                      );
                    })),
                const SizedBox(height: 30),
                Obx(() => RoundButton(
                    loading: loginController.loginStatus,
                    onPressFunc: () {
                      loginController.pressedLogin(context,
                          email.text.toString(), passcode.text.toString());
                    },
                    name: "Login")),
                const SizedBox(height: 200),
              ],
            ),
          )),
        ));
  }
}
