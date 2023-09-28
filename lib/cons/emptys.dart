import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/widgts/text.dart';

empty_image(String title,IconData icon) {
  Get.snackbar('', '',
      titleText: const text(
        title: '!تنبيه',
        size: 20,
        alint: TextAlign.end,
        fontcolore: primcolor,
      ),
      messageText:  text(
        title: title,
        size: 20,
        alint: TextAlign.end,
      ),
      icon:  Icon(
        icon,
        size: 40,
        color: primcolor,
      ));
}

empty_gender() {
  Get.snackbar('', '',
      titleText: text(
        title: '!تنبيه',
        size: 20,
        alint: TextAlign.end,
        fontcolore: primcolor,
      ),
      messageText: text(
        title: 'يجب اختيار الجنس',
        size: 20,
        alint: TextAlign.end,
      ),
      icon: Icon(
        Icons.person,
        size: 40,
        color: primcolor,
      ));
}
