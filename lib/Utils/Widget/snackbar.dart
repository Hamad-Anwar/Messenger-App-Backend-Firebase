import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ShowSnackBar{
  ShowSnackBar(String title,String msg){
    Get.snackbar(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      icon: const FlutterLogo(),
      snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        snackStyle: SnackStyle.FLOATING,
        title, msg
    );
  }
}