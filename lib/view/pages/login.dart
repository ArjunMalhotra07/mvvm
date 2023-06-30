import 'package:flutter/material.dart';

import '../utils/utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  decoration: InputDecoration(
                      hintText: "Email",
                      enabledBorder: OutlineInputBorder(
                        borderSide: Utils.giveBorder(Colors.blue, width: 2.0),
                        borderRadius: Utils.giveRadius(radius: 10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: Utils.giveBorder(Colors.red, width: 2.0),
                        borderRadius: Utils.giveRadius(radius: 10),
                      )),
                )
              ],
            ),
          )),
        ));
  }
}
