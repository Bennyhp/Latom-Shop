import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'misc/color.dart';
import 'splashscreen.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Red,
      ),
      home: const SplashPage(),
    );
  }
}
