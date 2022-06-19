import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextControl extends GetxController {
  TextEditingController ctrlIDPlayer = TextEditingController();

  @override
  void onClose() {
    ctrlIDPlayer.dispose();
    super.onClose();
  }
}

class RadioController extends GetxController {
  var buttonTopup = "".obs;
  var buttonBayar = "".obs;
  int harga = 0;
  var jenis = "";
  var gambar = "";

  void setButtonBayar(String value) {
    buttonBayar.value = value;
  }
}
