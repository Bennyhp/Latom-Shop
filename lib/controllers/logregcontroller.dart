import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class LogRegControl extends GetxController {
  var email = "".obs, password = "".obs;

  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();
}
