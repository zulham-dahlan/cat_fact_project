import 'package:cat_fact/data/preferences/user_preference.dart';
import 'package:cat_fact/features/home/view/pages/home_screen.dart';
import 'package:cat_fact/features/login/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var secure = true.obs;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    secure.value = !secure.value;
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      await UserPreference().setUser(usernameController.text);

      final UserModel user = UserModel(username: usernameController.text);
      Get.put<UserModel>(user);

      Get.offAllNamed(HomeScreen.routeName);
    }
  }
}
