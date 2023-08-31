
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetCustomSnackBar{
  static SnackbarController getSnackBar(String message, {Color? color}){
    return Get.showSnackbar(
      GetSnackBar(
        message: message,
        backgroundColor: color ?? Colors.black,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}