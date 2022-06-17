import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioController extends GetxController {
  var button = "".obs;

  onChange(value) {
    button(value);
  }
}

// BELUM CONNECT