import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class PassControl extends GetxController {
  var oldPass = "".obs, newPass = "".obs;

  TextEditingController ctrlOldPass = TextEditingController();
  TextEditingController ctrlNewPass = TextEditingController();
}
