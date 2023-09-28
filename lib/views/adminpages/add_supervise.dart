import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/cons/exsisting.dart';
import 'package:smart_parking_project1/cons/validat_fun.dart';
import 'package:smart_parking_project1/main.dart';
import 'package:smart_parking_project1/model/CRUD.dart';
import 'package:smart_parking_project1/model/linkes.dart';

import 'package:smart_parking_project1/widgts/textformfild.dart';

import '../../cons/sucss.dart';
import '../../widgts/text.dart';

class add_supervis extends StatefulWidget {
  const add_supervis({super.key});

  @override
  State<add_supervis> createState() => _add_supervisState();
}

class _add_supervisState extends State<add_supervis> with Crud {
  var _key = GlobalKey<FormState>();
  var email = TextEditingController();
  var username = TextEditingController();
  var name = TextEditingController();
  var password = TextEditingController();
  var phone = TextEditingController();
  var address = TextEditingController();
  bool isadding = false;

  add_supers() async {
    if (_key.currentState!.validate()) {
      isadding = true;
      setState(() {});

      var response = await postRequst(Applinks.Admin_add_super, {
        'name': name.text,
        'address': address.text,
        'email': email.text,
        'phone': phone.text,
        'username': username.text,
        'password': password.text,
        'ad_id': sharedPref.getString('id_admin').toString()
      });
      if (response['s'] == 's') {
        Get.back();
        sucss_add();
        email.clear();
        username.clear();

        name.clear();
        password.clear();
        phone.clear();
        address.clear();
      } else {
        isadding = false;
        setState(() {});
        exsist();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Align(
            alignment: Alignment.centerRight,
            child: text(
              title: 'اضافة مشرف ',
              fontcolore: Colors.black,
              weight: FontWeight.bold,
              size: 25,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ))),
      body: SingleChildScrollView(
        child: isadding == true
            ? Center(
                child: Lottie.asset('lotties/loading.json'),
              )
            : Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Textformfiled(
                        validat: (val) {
                          return validate(val!, 10, 30, 'email');
                        },
                        controller: email,
                        textinput: TextInputType.emailAddress,
                        lable_text: 'الايميل',
                        suffixicone: Icons.email,
                        obsc: false),
                    Textformfiled(
                        validat: (val) {
                          return validate(val!, 5, 12, 'username');
                        },
                        controller: username,
                        lable_text: 'اسم المستخدم',
                        suffixicone: Icons.person,
                        obsc: false),
                    Textformfiled(
                        validat: (val) {
                          return validate(val!, 5, 20, 'name');
                        },
                        controller: name,
                        lable_text: 'اسم المشرف',
                        suffixicone: Icons.person,
                        obsc: false),
                    Textformfiled(
                        validat: (val) {
                          return validate(val!, 8, 20, 'password');
                        },
                        controller: password,
                        lable_text: 'كلمة المرور',
                        suffixicone: Icons.password,
                        obsc: false),
                    Textformfiled(
                        validat: (val) {
                          return validate(val!, 9, 10, 'phone');
                        },
                        controller: phone,
                        textinput: TextInputType.phone,
                        lable_text: 'رقم الجوال',
                        suffixicone: Icons.phone_android,
                        obsc: false),
                    Textformfiled(
                        validat: (val) {
                          return validate(val!, 4, 20, 'address');
                        },
                        controller: address,
                        lable_text: 'العنوان',
                        suffixicone: Icons.location_city,
                        obsc: false),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        add_supers();
                      },
                      child: text(
                        title: 'اضافه',
                        size: 20,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(primcolor),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                            horizontal: 100, vertical: 10)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
