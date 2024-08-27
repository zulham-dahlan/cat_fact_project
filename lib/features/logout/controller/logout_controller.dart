import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cat_fact/data/preferences/user_preference.dart';
import 'package:cat_fact/features/login/view/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController {
  void showDialogConfirmation(BuildContext context) {
    AwesomeDialog(
            context: context,
            dialogType: DialogType.WARNING,
            headerAnimationLoop: false,
            animType: AnimType.TOPSLIDE,
            showCloseIcon: true,
            closeIcon: const Icon(Icons.close_fullscreen_outlined),
            title: 'Logout',
            desc: 'Are you sure you want to logout?',
            btnCancelOnPress: () {},
            btnOkOnPress: () async {
              await UserPreference().clearDataUser();
              Get.offAllNamed(LoginScreen.routeName);
            },
            btnCancelText: "No",
            btnOkText: "Yes")
        .show();
  }
}
