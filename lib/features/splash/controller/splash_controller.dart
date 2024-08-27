import 'package:cat_fact/data/preferences/user_preference.dart';
import 'package:cat_fact/features/home/view/pages/home_screen.dart';
import 'package:cat_fact/features/login/model/user_model.dart';
import 'package:cat_fact/features/login/view/pages/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final UserPreference _userPreference = UserPreference();

  @override
  void onInit() {
    super.onInit();
    _checkUser();
  }

  Future<void> _checkUser() async {
    await Future.delayed(const Duration(seconds: 3));
    final username = await _userPreference.getUser();
    if (username != null) {
      final UserModel user = UserModel(username: username);
      Get.put<UserModel>(user);

      Get.offAllNamed(HomeScreen.routeName);
    } else {
      Get.offAllNamed(LoginScreen.routeName);
    }
  }
}
