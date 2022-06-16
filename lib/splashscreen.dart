import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/splashcontroller.dart';
import 'misc/color.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashController sc = Get.put(SplashController());
    return Scaffold(
      backgroundColor: Red,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/logo/logo_splash.jpg"),
          ),
        ),
      ),
    );
  }
}
