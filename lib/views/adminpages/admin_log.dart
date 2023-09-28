import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_parking_project1/cons/exsisting.dart';
import 'package:smart_parking_project1/cons/validat_fun.dart';
import 'package:smart_parking_project1/main.dart';
import 'package:smart_parking_project1/model/CRUD.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import 'package:smart_parking_project1/views/users_pages/display_parking.dart';
import 'package:smart_parking_project1/widgts/textformfild.dart';
import '../../cons/color.dart';
import '../../widgts/text.dart';
import 'admin_home.dart';

class admin_log extends StatefulWidget {
  const admin_log({super.key});

  @override
  State<admin_log> createState() => _admin_logState();
}

class _admin_logState extends State<admin_log> with Crud {
  var _key = GlobalKey<FormState>();
  var username = TextEditingController();
  var password = TextEditingController();

  bool isloading = false;

  var cheek = false;
  var _obsu = true;

  login() async {
    isloading = true;
    setState(() {});
    var response = await postRequst(Applinks.Admin_login,
        {'username': username.text, 'password': password.text});
    if (response['s'] == 's') {
      sharedPref.setString('id_admin', response['data']['admin_id'].toString());

      setState(() {});
      Get.offAll(admin_home());
    } else {
      isloading = false;
      setState(() {});
      filed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: isloading == true
              ? Center(
                  child: Lottie.asset('lotties/loading.json'),
                )
              : Form(
                  key: _key,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: text(
                              title: 'تسجيل الدخول للاداره',
                              size: 25,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Textformfiled(
                          controller: username,
                          validat: (val) {
                            return validate(val!, 4, 20, 'usrname');
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
                            return validate(val!, 8, 15, 'password');
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
                            child: Icon(
                                _obsu ? Icons.visibility : Icons.visibility_off,
                                color: const Color.fromRGBO(169, 169, 169, 1)),
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
                            const text(
                              title: 'تذكرني',
                              size: 20,
                              weight: FontWeight.bold,
                              fontcolore: primcolor,
                            ),
                          ],
                        ),
                        const SizedBox(
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
                            backgroundColor:
                                MaterialStateProperty.all(primcolor),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 10)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
