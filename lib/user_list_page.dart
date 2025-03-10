import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_controller.dart';

class UserListPage extends StatelessWidget {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User List")),
      body: Obx(() => ListView.builder(
        itemCount: userController.userList.length,
        itemBuilder: (context, index) {
          final user = userController.userList[index];

          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(user.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email: ${user.email}"),
                  Text("Phone: ${user.phone}"),
                  Text("Address: ${user.address}"),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => userController.deleteUser(index),
              ),
            ),
          );
        },
      )),
    );
  }
}
