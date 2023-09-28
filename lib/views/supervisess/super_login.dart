import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_project1/cons/exsisting.dart';
import 'package:smart_parking_project1/cons/validat_fun.dart';
import 'package:smart_parking_project1/main.dart';
import 'package:smart_parking_project1/model/CRUD.dart';
import 'package:smart_parking_project1/views/supervisess/home_supervis.dart';

import '../../cons/color.dart';
import '../../model/linkes.dart';
import '../../widgts/text.dart';
import '../../widgts/textformfild.dart';

class super_login extends StatefulWidget {
  const super_login({super.key});

  @override
  State<super_login> createState() => _super_loginState();
}

class _super_loginState extends State<super_login> with Crud {
  var _key = GlobalKey<FormState>();

  var useername = TextEditingController();
  var password = TextEditingController();

  bool _obsu = true;
  var cheek = false;

  log_super() async {
    if (_key.currentState!.validate()) {
      var response = await postRequst(Applinks.super_login,
          {'username': useername.text, 'password': password.text});
      if (response['s'] == 's') {
        sharedPref.setString(
            'super_id', response['data']['super_id'].toString());
        sharedPref.setString('super_name', response['data']['super_name']);

        Get.offAll(supervisess_home());
      } else {
        filed();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: text(
                    title: 'تسجيل الدخول للمشرف',
                    size: 25,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
              Textformfiled(
                controller: useername,
                validat: (val) {
                  return validate(val!, 5, 20, 'username');
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
                  return validate(val!, 8, 30, 'password');
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
                  log_super();
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
            ],
          ),
        ),
      )),
    );
  }
}
