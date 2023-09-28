import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/widgts/text.dart';

Future<bool> choose_image(Function()? camera, Function()? gally) {
  Get.defaultDialog(
      title: 'اختيار موضع الصوره',
      middleText: 'اختيار موضع الصوره من الكاميرا او المعرض',
      titleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      actions: [
        MaterialButton(
          onPressed: camera,
          child: const text(
            title: 'الكاميرا',
            fontcolore: primcolor,
            size: 18,
            weight: FontWeight.bold,
          ),
        ),
        MaterialButton(
          onPressed: gally,
          child: const text(
            title: 'المعرض',
            size: 18,
            weight: FontWeight.bold,
          ),
        )
      ]);

  return Future.value(true);
}


 show_iamge(){

}