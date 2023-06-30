import 'package:flutter/material.dart';
import 'package:mvvm/view/pages/home.dart';
import 'package:mvvm/view/pages/login.dart';
import 'package:mvvm/view/utils/routes/routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginPage());
      default:
        return MaterialPageRoute(builder: (_) => const NoSuchPageScreen());
    }
  }
}

class NoSuchPageScreen extends StatelessWidget {
  const NoSuchPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("No Such Screen"),
        ),
        body: Container());
  }
}
