import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/networking/repository/user_repo.dart';

import '../../view_model/model/user_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserRepository());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Home"),
        ),
        body: FutureBuilder(
            future: userController.fetchUsersApi(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return const Text('ERROR');
              }
              final Users users = snapshot.data!;
              return ListView.builder(
                  itemCount: users.data.length,
                  itemBuilder: (context, index) => ListTile(
                        leading: CircleAvatar(
                          child: Image(
                              image: NetworkImage(users.data[index].avatar)),
                        ),
                        title: Text(users.data[index].email),
                        subtitle: Text(users.data[index].firstName),
                      ));
            }));
  }
}
