import 'package:cat_fact/data/helper/page_routes.dart';
import 'package:cat_fact/features/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cat Fact',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      getPages: routes,
    );
  }
}
