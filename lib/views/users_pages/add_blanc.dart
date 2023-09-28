import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_parking_project1/cons/choose_iamge.dart';
import 'package:smart_parking_project1/cons/emptys.dart';
import 'package:smart_parking_project1/cons/validat_fun.dart';
import 'package:smart_parking_project1/main.dart';
import 'package:smart_parking_project1/model/CRUD.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import 'package:smart_parking_project1/widgts/textformfild.dart';
import 'package:image_picker/image_picker.dart';
import '../../cons/color.dart';
import '../../widgts/text.dart';

class add_blanc extends StatefulWidget {
  add_blanc({super.key});

  @override
  State<add_blanc> createState() => _add_blancState();
}

class _add_blancState extends State<add_blanc> with Crud {
  File? _image;
  bool loading = false;
  var blance = TextEditingController();
  var _key = GlobalKey<FormState>();
  final imagepicker = ImagePicker();
  uploadcamera() async {
    final XFile? picked =
        await imagepicker.pickImage(source: ImageSource.camera);

    if (picked == null) {
      Get.back();
      return;
    }
    setState(() {
      _image = File(picked.path);
      Get.back();
    });
  }

  uploadgallry() async {
    final XFile? picked =
        await imagepicker.pickImage(source: ImageSource.gallery);

    if (picked == null) {
      Get.back();
      return;
    }
    setState(() {
      _image = File(picked.path);
      Get.back();
    });
  }

  add_blances() async {
    if (_image == null)
      return empty_image('الرجاء ارفاق سند الايداع', Icons.money);
    if (_key.currentState!.validate()) {
      loading = true;
      setState(() {});
      var response = await PostwithFile(
          Applinks.add_amount_link,
          {'price': blance.text, 'id': sharedPref.getString('user_id')},
          _image!);
      if (response['s'] == 's') {
        loading = false;
        setState(() {});
        _image!.deleteSync();
        blance.clear();
      } else {
        print('e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Align(
            alignment: Alignment.centerRight,
            child: text(
              title: 'اضافة الرصيد',
              fontcolore: Colors.black,
              weight: FontWeight.bold,
            ),
          )),
      body: SingleChildScrollView(
        child: loading == true
            ? Center(
                child: Lottie.asset('lotties/loading.json'),
              )
            : Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        height: 350,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/omqy.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Textformfiled(
                        validat: (val) {
                          return validate(val!, 3, 10, 'double');
                        },
                        controller: blance,
                        textinput: TextInputType.phone,
                        lable_text: 'الرصيد المراد اضافته',
                        suffixicone: Icons.money,
                        obsc: false),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        choose_image(uploadcamera, uploadgallry);
                      },
                      child: _image == null
                          ? text(
                              title: 'ارفاق صورة االسند',
                              size: 20,
                            )
                          : text(
                              title: 'تم الارفاق',
                              size: 20,
                            ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            _image == null
                                ? Color.fromRGBO(188, 0, 99, 0.2)
                                : Colors.green),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 60, vertical: 10)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: (() {
                          if (_image == null) {
                            empty_image('لايوجد صورة لعرضها', Icons.image);
                          } else {
                            Get.defaultDialog(
                                title: 'عرض سند الايداع',
                                content: Container(
                                  height: 300,
                                  width: 300,
                                  child: InteractiveViewer(
                                      scaleEnabled: true,
                                      minScale: 0.3,
                                      maxScale: 3,
                                      child: Image.file(
                                        _image!,
                                        fit: BoxFit.fill,
                                      )),
                                ));
                          }
                        }),
                        icon: Icon(
                          Icons.image,
                          color: primcolor,
                          size: 30,
                        )),
                    ElevatedButton(
                      onPressed: () {
                        add_blances();
                      },
                      child: text(
                        title: 'ارسال الطلب',
                        size: 20,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(primcolor),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 60, vertical: 10)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
