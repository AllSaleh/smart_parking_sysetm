import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_parking_project1/cons/choose_iamge.dart';
import 'package:smart_parking_project1/cons/emptys.dart';
import 'package:smart_parking_project1/cons/exsisting.dart';
import 'package:smart_parking_project1/cons/validat_fun.dart';
import 'package:smart_parking_project1/model/CRUD.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import 'package:smart_parking_project1/views/userpages/authpages/login_page.dart';

import '../../../cons/color.dart';
import '../../../widgts/text.dart';
import '../../../widgts/textformfild.dart';

class signup extends StatefulWidget {
  final String username;
  final String password;
  const signup({super.key, required this.username, required this.password});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> with Crud {
  File? _image;
  var _key = GlobalKey<FormState>();
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var gender = TextEditingController();
  var address = TextEditingController();

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

  signup() async {
    if (_key.currentState!.validate()) {
      if (_image == null) return empty_image('لايمكن ترك صورة الملف الشخصي فارغه',Icons.person);
      if (_gender == null) return empty_gender();
      var rsponse = await PostwithFile(
          Applinks.Signup,
          {
            'name': name.text,
            'email': email.text,
            'phone': phone.text,
            'gender': _gender.toString(),
            'username': widget.username,
            'password': widget.password
          },
          _image!);
      if (rsponse['s'] == 's') {
        Get.offAll(Loginpage());
      } else {
        exsist();
      }
    }
  }

  bool _obsu = false;
  bool _obsu2 = false;
  var _gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: text(
            title: 'انشئ الملف الشخصي',
            size: 25,
            fontcolore: Colors.black,
            weight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: Icon(
              Icons.arrow_back,
              color: primcolor,
              size: 25,
            )),
      ),
      body: SafeArea(
          child: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  choose_image(uploadcamera, uploadgallry);
                },
                child: CircleAvatar(
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    backgroundColor: grey,
                    radius: 60,
                    child: _image == null
                        ? const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 60,
                          )
                        : null),
              ),
              const SizedBox(
                height: 30,
              ),
              Textformfiled(
                controller: name,
                validat: (val) {
                  return validate(val!, 5, 12, 'name');
                },
                textinput: TextInputType.name,
                obsc: false,
                lable_text: 'الاسم',
                suffixicone: Icons.person,
              ),
              const SizedBox(
                height: 10,
              ),
              Textformfiled(
                  controller: email,
                  validat: (val) {
                    return validate(val!, 10, 20, 'email');
                  },
                  textinput: TextInputType.emailAddress,
                  lable_text: 'البريد الالكتروني',
                  suffixicone: Icons.email,
                  obsc: false),
              const SizedBox(
                height: 10,
              ),
              Textformfiled(
                  validat: (val) {
                    return validate(val!, 9, 12, 'phone');
                  },
                  controller: phone,
                  textinput: TextInputType.phone,
                  lable_text: 'رقم الجوال',
                  suffixicone: Icons.phone_android,
                  obsc: false),
              const SizedBox(
                height: 10,
              ),
              Textformfiled(
                  validat: (val) {
                    return validate(val!, 5, 12, 'address');
                  },
                  controller: address,
                  lable_text: "العنوان",
                  suffixicone: Icons.location_city,
                  obsc: false),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Radio(
                          activeColor: primcolor,
                          value: 1,
                          groupValue: _gender,
                          onChanged: (val) {
                            setState(() {
                              _gender = val;
                            });
                          }),
                      const text(
                        title: 'ذكر',
                        size: 15,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Radio(
                          activeColor: primcolor,
                          value: 0,
                          groupValue: _gender,
                          onChanged: (val) {
                            setState(() {
                              _gender = val;
                            });
                          }),
                      const text(
                        title: 'انثى',
                        size: 15,
                      )
                    ],
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  signup();
                },
                child: text(
                  title: 'انشاء حساب',
                  size: 20,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primcolor),
                  padding: MaterialStateProperty.all(
                    const  EdgeInsets.symmetric(horizontal: 100, vertical: 10)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
