import 'package:cat_fact/features/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = "/splash_screen";

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
        body: Center(
      child: Lottie.asset("lottie/loading_cat.json",
          width: MediaQuery.of(context).size.width / 2),
    ));
  }
}
