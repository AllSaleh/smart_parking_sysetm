import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_parking_project1/cons/color.dart';

import '../widgts/text.dart';

sucss_add() {
  Get.snackbar('', '',
      titleText: const text(
        title: '!تم',
        size: 20,
        alint: TextAlign.end,
        fontcolore: primcolor,
      ),
      messageText: const text(
        title: 'تمت اضافة المشرف  بنجاح',
        size: 20,
        alint: TextAlign.end,
      ),
      icon: const Icon(
        Icons.person,
        size: 40,
        color: primcolor,
      ));
}
