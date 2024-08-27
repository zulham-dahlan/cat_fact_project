import 'package:cat_fact/features/login/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    final UserModel user = Get.find<UserModel>();

    return Scaffold(
      body: Center(
        child: Text(user.username),
      ),
    );
  }
}
