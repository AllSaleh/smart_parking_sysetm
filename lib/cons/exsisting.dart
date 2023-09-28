import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_project1/cons/color.dart';

Future<bool> exsist() {
  Get.defaultDialog(
      onConfirm: () {
        Get.back();
      },
      textConfirm: 'حسنا',
      confirmTextColor: Colors.white,
      buttonColor: primcolor,
      barrierDismissible: false,
      title: 'تنبيه',
      middleText: 'هذا الحساب موجود مسبقا',
      middleTextStyle: const TextStyle(fontSize: 22),
      titleStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold));

  return Future.value(true);
}

Future<bool> filed() {
  Get.defaultDialog(
      onConfirm: () {
        Get.back();
      },
      textConfirm: 'حسنا',
      confirmTextColor: Colors.white,
      buttonColor: primcolor,
      barrierDismissible: false,
      title: 'تنبيه',
      middleText: 'اسم المستخدم او كلمة المرور غير صحيحه',
      middleTextStyle: const TextStyle(fontSize: 22),
      titleStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold));

  return Future.value(true);
}
