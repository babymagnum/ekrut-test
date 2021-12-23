import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonFunction {
  static standartSnackbar(String title, String message) {
    if (Get.isSnackbarOpen ?? false) Get.back();

    Get.snackbar(title, message, snackStyle: SnackStyle.FLOATING, titleText: null, borderRadius: 6,
        maxWidth: Get.width,
        duration: Duration(seconds: 5),
        barBlur: 5,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black12,
        margin: EdgeInsets.all(16.w));
  }
}