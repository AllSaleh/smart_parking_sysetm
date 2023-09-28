import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_project1/cons/validat_fun.dart';

import '../../../cons/color.dart';
import '../../../widgts/text.dart';
import '../../../widgts/textformfild.dart';
import 'signup.dart';

class home_signup extends StatefulWidget {
  const home_signup({super.key});

  @override
  State<home_signup> createState() => _home_signupState();
}

class _home_signupState extends State<home_signup> {
  bool cheek = false;
  var _key = GlobalKey<FormState>();
  var username = TextEditingController();
  var password = TextEditingController();
  bool _obsu = false;

  signupfun() {
    if (_key.currentState!.validate()) {
      Get.to(signup(username: username.text, password: password.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 150,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: text(
                    title: 'تسجيل حساب جديد',
                    size: 25,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              Textformfiled(
                controller: username,
                validat: (val) {
                  return validate(val!, 8, 20, 'username');
                },
                obsc: false,
                lable_text: 'اسـم المستخدم',
                suffixicone: Icons.person,
              ),
              const SizedBox(
                height: 15,
              ),
              Textformfiled(
                controller: password,
                validat: (val) {
                  return validate(val!, 9, 15, 'password');
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
              const SizedBox(
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
                  signupfun();
                 
                },
                child: const text(
                  title: 'انشاء حساب',
                  size: 20,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primcolor),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      horizontal: 100, vertical: 10)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
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
                      Navigator.pop(context);
                    },
                    child: const text(
                      title: 'تسجيل الدخول',
                      size: 20,
                      weight: FontWeight.bold,
                      fontcolore: primcolor,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const text(
                    title: ' لديك حساب؟',
                    size: 20,
                    fontcolore: grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
    ;
  }
}
