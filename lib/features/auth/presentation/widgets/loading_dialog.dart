import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interviewapp/core/utils/utils.dart';


class Dialogs {
  static Future<void> showLoadingDialog({String? message = "Loading"}) async {
     return Get.defaultDialog(
        title: message!,
        titleStyle: TextStyle(color: CustomColor.liteGreen),
        content: CircularProgressIndicator(color: CustomColor.liteGreen),
        barrierDismissible: false,
      );
  }
}