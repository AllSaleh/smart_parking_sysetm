import 'package:flutter/material.dart';
import 'package:smart_parking_project1/cons/exsisting.dart';
import 'package:smart_parking_project1/cons/validat_fun.dart';
import 'package:smart_parking_project1/main.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import 'package:smart_parking_project1/views/userpages/authpages/home_signup.dart';
import 'package:smart_parking_project1/views/userpages/authpages/signup.dart';

import 'package:smart_parking_project1/views/userpages/user_home.dart';
import 'package:smart_parking_project1/widgts/text.dart';

import '../../../cons/color.dart';
import '../../../model/CRUD.dart';
import '../../../widgts/textformfild.dart';
import 'package:get/get.dart';

import '../../adminpages/admin_log.dart';
import '../../supervisess/super_login.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> with Crud {
  login() async {
    if (_key.currentState!.validate()) {
      var response = await postRequst(Applinks.Login,
          {'username': username.text, 'password': password.text});
      if (response['s'] == 's') {
        sharedPref.setString('user_id', response['data']['user_id'].toString());
        


        sharedPref.setString(
            'user_email', response['data']['user_email'].toString());

        Get.offAll(user_home());
      } else {
        filed();
      }
    }
  }

  var username = TextEditingController();
  var password = TextEditingController();

  bool cheek = false;
  var _key = GlobalKey<FormState>();
  bool _obsu = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: (() {
                        Get.offAll(super_login());
                      }),
                      icon: Icon(
                        Icons.supervised_user_circle,
                        size: 35,
                        color: primcolor,
                      )),
                  IconButton(
                      onPressed: (() {
                        Get.offAll(admin_log());
                      }),
                      icon: Icon(
                        Icons.admin_panel_settings,
                        size: 35,
                        color: primcolor,
                      ))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: text(
                    title: 'تسجيل الدخول',
                    size: 25,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
              Textformfiled(
                controller: username,
                validat: (val) {
                  return validate(val!, 5, 12, 'username');
                },
                obsc: false,
                lable_text: 'اسـم المستخدم',
                suffixicone: Icons.person,
              ),
              SizedBox(
                height: 15,
              ),
              Textformfiled(
                controller: password,
                validat: (val) {
                  return validate(val!, 9, 20, 'password');
                },
                obsc: _obsu,
                lable_text: 'كلمة المرور',
                suffixicone: Icons.password,
                prefxicon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obsu = !_obsu;
                    });
                  },
                  child: Icon(_obsu ? Icons.visibility : Icons.visibility_off,
                      color: Color.fromRGBO(169, 169, 169, 1)),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      fillColor: MaterialStateProperty.all(primcolor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: primcolor)),
                      value: cheek,
                      onChanged: ((value) {
                        setState(() {
                          cheek = value!;
                        });
                      })),
                  text(
                    title: 'تذكرني',
                    size: 20,
                    weight: FontWeight.bold,
                    fontcolore: primcolor,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  login();
                },
                child: text(
                  title: 'تسجيل الدخول',
                  size: 20,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primcolor),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 100, vertical: 10)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: text(
                  title: 'هل نسيت كلمة المرور؟',
                  fontcolore: primcolor,
                  size: 20,
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Divider(
                    height: 40,
                    thickness: 2,
                    color: grey,
                  ),
                  Positioned(
                    top: 10,
                    left: MediaQuery.of(context).size.width * 0.4,
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.white,
                        child: text(
                          title: 'او باستخدام',
                          fontcolore: grey,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset('images/ap.jpg'),
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Image.asset('images/g.png'),
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Image.asset('images/f.png'),
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      var route = MaterialPageRoute(
                        builder: (context) {
                          return home_signup();
                        },
                      );
                      Navigator.push(context, route);
                    },
                    child: text(
                      title: 'تسجيل',
                      size: 20,
                      weight: FontWeight.bold,
                      fontcolore: primcolor,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  text(
                    title: 'ليس لديك حساب؟',
                    size: 20,
                    fontcolore: grey,
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
