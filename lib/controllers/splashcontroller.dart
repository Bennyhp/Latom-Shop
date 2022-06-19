import 'dart:async';
import 'package:get/get.dart';
import 'package:latom_shop/homepage.dart';
import '../loginpage.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    splashStart();
  }

  splashStart() {
    var durasi = const Duration(seconds: 3);
    return Timer(
      durasi,
      () {
        Get.off(const LoginPage());
      },
    );
  }
}
