import 'package:cat_fact/features/logout/controller/logout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonLogout extends StatelessWidget {
  ButtonLogout({super.key});
  final LogoutController logoutController = Get.put(LogoutController());

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          logoutController.showDialogConfirmation(context);
        },
        icon: const Icon(
          Icons.logout,
          size: 20,
          color: Colors.white,
        ));
  }
}
