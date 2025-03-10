import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_controller.dart';
import 'user_model.dart';
import 'user_list_page.dart';

class HomePage extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void saveUser() {
    final newUser = UserModel(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      address: addressController.text,
    );

    userController.addUser(newUser);

    // Clear text fields
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    addressController.clear();

    Get.snackbar("Success", "User added successfully!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add User")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: phoneController, decoration: InputDecoration(labelText: "Phone")),
            TextField(controller: addressController, decoration: InputDecoration(labelText: "Address")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveUser,
              child: Text("Save User"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.to(UserListPage()),
              child: Text("View Users"),
            ),
          ],
        ),
      ),
    );
  }
}
