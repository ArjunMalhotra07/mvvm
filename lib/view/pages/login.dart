import 'package:flutter/material.dart';

import '../utils/utils.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final ValueNotifier<bool> obscurePasscode = ValueNotifier<bool>(true);
  final TextEditingController email = TextEditingController();
  final TextEditingController passcode = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: Utils.giveBorder(Colors.red, width: 2.0),
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
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  Utils.giveBorder(Colors.red, width: 2.0),
                              borderRadius: Utils.giveRadius(radius: 10),
                            )),
                      );
                    })),
                const SizedBox(height: 200),
              ],
            ),
          )),
        ));
  }
}
