import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_parking_project1/PViwe.dart';
import 'package:smart_parking_project1/cons/emptys.dart';
import 'package:smart_parking_project1/cons/exsisting.dart';
import 'package:smart_parking_project1/cons/validat_fun.dart';
import 'package:smart_parking_project1/main.dart';
import 'package:smart_parking_project1/model/CRUD.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import 'package:smart_parking_project1/views/adminpages/admin_home.dart';
import 'package:smart_parking_project1/widgts/textformfild.dart';

import '../../../cons/color.dart';
import '../../../widgts/text.dart';

class add_build extends StatefulWidget {
  const add_build({super.key});

  @override
  State<add_build> createState() => _add_buildState();
}

class _add_buildState extends State<add_build> with Crud {
  display_supers() async {
    var response = await getRequest(Applinks.Admin_display_supers);
    return response;
  }

  add_builds() async {
    if (_key.currentState!.validate()) {
      if (_super_name == null) {
        return empty_image('اختر المشرف', Icons.error);
      }
      loading = true;
      var response = await postRequst(Applinks.Admin_add_build, {
        'name': name.text,
        'location': location.text,
        'super': _super_name,
        'ad_id': sharedPref.getString('id_admin').toString()
      });
      loading = false;

      if (response['s'] == 's') {
        Get.offAll(admin_home());
      } else {
        empty_image('هذا المشرف مضاف مسبقا', Icons.error);
      }
    }
  }

  bool loading = false;
  var _super_name;
  var _id_super;
  var name = TextEditingController();
  var location = TextEditingController();
  var _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: text(
              title: 'اضافة مبنى',
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
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ))),
      body: SingleChildScrollView(
          child: Form(
        key: _key,
        child: loading == true
            ? Center(child: Lottie.asset('lotties/loading.json'))
            : Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Textformfiled(
                      validat: (val) {
                        return validate(val!, 4, 20, 'build');
                      },
                      lable_text: 'اسم المبنى',
                      suffixicone: Icons.location_city,
                      obsc: false),
                  Textformfiled(
                      validat: (val) {
                        return validate(val!, 4, 20, 'location');
                      },
                      lable_text: 'موقع المبنى',
                      suffixicone: Icons.home,
                      obsc: false),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: (() {
                      Get.bottomSheet(Center(
                          child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        primcolor,
                                        grey,
                                      ]),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 70,
                                  ),
                                  text(
                                    title: 'اختيار المشرف',
                                    size: 25,
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  FutureBuilder(
                                    future: display_supers(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        if (snapshot.data['s'] == 'f') {
                                          return const Center(
                                            child: text(
                                              title: 'لايوجد مواقف متاحه',
                                              size: 25,
                                            ),
                                          );
                                        }
                                        return GridView.builder(
                                          shrinkWrap: true,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                          ),
                                          itemCount:
                                              snapshot.data['data'].length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () {
                                                _super_name =
                                                    snapshot.data['data'][index]
                                                        ['super_name'];
                                                _id_super =
                                                    snapshot.data['data'][index]
                                                        ['super_id'];
                                                setState(() {});
                                                Get.back();
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 20,
                                                    right: 20,
                                                    left: 20),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          Colors.black,
                                                          primcolor,
                                                        ]),
                                                  ),
                                                  child: Center(
                                                      child: text(
                                                    title:
                                                        '${snapshot.data['data'][index]['super_name']}',
                                                    fontcolore: grey,
                                                    size: 20,
                                                    weight: FontWeight.bold,
                                                  )),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: Lottie.asset(
                                              'lotties/loading.json'),
                                        );
                                      } else {
                                        return Center(
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {});
                                            },
                                            child: const text(
                                              title: 'التحقق من اتصال الانترنت',
                                              fontcolore: Colors.blue,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  )
                                ],
                              )))));
                    }),
                    child: text(
                      title: _super_name == null
                          ? 'اختر المشرف'
                          : '${_super_name}  المشرف',
                      fontcolore: primcolor,
                      weight: FontWeight.bold,
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      add_builds();
                    },
                    child: text(
                      title: 'اضافه',
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
                ],
              ),
      )),
    );
  }
}
