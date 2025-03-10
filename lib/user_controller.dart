import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'user_model.dart';

class UserController extends GetxController {
  final Box<UserModel> _userBox = Hive.box<UserModel>('users');

  var userList = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }

  void loadUsers() {
    userList.value = _userBox.values.toList();
  }

  void addUser(UserModel user) {
    _userBox.add(user);
    loadUsers(); // Refresh the list
  }

  void deleteUser(int index) {
    _userBox.deleteAt(index);
    loadUsers();
  }
}
