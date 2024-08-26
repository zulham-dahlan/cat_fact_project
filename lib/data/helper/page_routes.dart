import 'package:cat_fact/features/home/view/pages/home_screen.dart';
import 'package:cat_fact/features/login/view/pages/login_screen.dart';
import 'package:cat_fact/features/splash/view/splash_screen.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
  GetPage(name: HomeScreen.routeName, page: () => const HomeScreen()),
  GetPage(name: LoginScreen.routeName, page: () => const LoginScreen())
];
