# hive_with_getx

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Getting Started

add .yaml

- get: ^4.7.2
- hive_flutter: ^1.1.0
- hive: ^2.2.3

- dev_dependencies:
    - hive_generator: ^2.0.1
    - build_runner: ^2.3.3

make model with
- HiveType typeId
- HiveField
  put part 'user_temp_model.g.dart';

then run command
- flutter pub run build_runner build

inside the main

```dart
await Hive.initFlutter();
Hive.registerAdapter(UserModelAdapter()); // Register the adapter
await Hive.openBox<UserModel>('users'); // Open a box for storing users
```

for api

```dart
  void onSignUp() async {
    if (checkValidations()) {
      Utils.closeKeyboard();
      AppClass().showLoading(true);
      Map<String, dynamic> params = {};
      params.putIfAbsent('email', () => isSelectEmail.value ? textEmailController.text.trim() : "");
      params.putIfAbsent('phoneNumber', () =>  !isSelectEmail.value ? textContactController.text.trim() : "");
      params.putIfAbsent('otpType', () =>  Constants.otpTypeSignUp );
      APIRepository().createSignUp(params).then((value) {
        AppClass().showLoading(false);
        value?.fold((l) {
          Utils.showMessage(l);
          debugPrint('$value');
        }, (r) async {
          debugPrint(r.toString());
          debugPrint("test==>2> #success..");
          Get.toNamed(AppRoutes.verificationPage,  arguments:[isSelectEmail.value, isSelectEmail.value ? textEmailController.text.trim() : textContactController.text.trim(),] );
          // UserToken userToken = userTokenFromJson(r.toString());
          // SessionStorage().setAuthToken(userToken.data.token);
        });
      });
    }
  }
```