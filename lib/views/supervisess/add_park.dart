import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_parking_project1/cons/emptys.dart';
import 'package:smart_parking_project1/cons/validat_fun.dart';
import 'package:smart_parking_project1/main.dart';
import 'package:smart_parking_project1/model/CRUD.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import 'package:smart_parking_project1/views/supervisess/home_supervis.dart';
import 'package:smart_parking_project1/widgts/textformfild.dart';

import '../../cons/color.dart';
import '../../widgts/text.dart';

class add_park extends StatefulWidget {
  add_park({super.key});

  @override
  State<add_park> createState() => _add_parkState();
}

class _add_parkState extends State<add_park> with Crud {
  display() async {
    var response = await getRequest(
        '${Applinks.display_build_super}?name=${sharedPref.getString('super_name')}');
    return response;
  }

  add() async {
    if (_buildname == null) {
      return empty_image('الرجاء اختيار المبنى', Icons.error);
    }
    if (_key.currentState!.validate()) {
      var response = await postRequst(Applinks.add_parking, {
        'park_no': park_name.text,
        'id_super': sharedPref.getString('super_id'),
        'id_buiding': _buildid.toString(),
        'price': price.text
      });

      if (response['s'] == 's') {
        empty_image('تمت اضافة الموقف بنجاح', Icons.done);
        Get.offAll(supervisess_home());
      } else {
        empty_image('هذا الموقف موجود مسبقا', Icons.error);
      }
      print(response);
    }
  }

  var super_name = TextEditingController();
  var build_name = TextEditingController();
  var park_name = TextEditingController();
  var price = TextEditingController();
  var _key = GlobalKey<FormState>();
  var _buildname;
  var _buildid;

  var size = SizedBox(
    height: 15,
  );
  @override
  void initState() {
    super_name.text = sharedPref.getString('super_name')!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: text(
              title: 'اضافة موقف ',
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              MaterialButton(
                onPressed: (() {
                  Get.bottomSheet(
                      SafeArea(
                        child: Center(
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
                                    title: 'اختيار الموقف',
                                    size: 25,
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  FutureBuilder(
                                    future: display(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        if (snapshot.data['s'] == 'f') {
                                          return const Center(
                                            child: text(
                                              title: 'لايوجد  مباني',
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
                                          itemCount: 1,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () {
                                                _buildname =
                                                    snapshot.data['data']
                                                        ['bulding_name'];
                                                _buildid = snapshot.data['data']
                                                    ['bulding_id'];
                                                Get.back();
                                                setState(() {});
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
                                                        '${snapshot.data['data']['bulding_name']}',
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
                              ))),
                        ),
                      ),
                      backgroundColor: grey,
                      isScrollControlled: true);
                }),
                child: const text(
                  title: 'اختيار المبنى',
                  size: 20,
                  weight: FontWeight.bold,
                  fontcolore: primcolor,
                ),
              ),
              size,
              Textformfiled(
                  enabl: false,
                  controller: super_name,
                  lable_text: 'اسم المشرف',
                  suffixicone: Icons.person,
                  obsc: false),
              size,
              Textformfiled(
                  controller: park_name,
                  validat: (val) {
                    return validate(val!, 4, 6, 'parkname');
                  },
                  lable_text: 'رقم الموقف',
                  suffixicone: Icons.local_parking,
                  obsc: false),
              size,
              Textformfiled(
                  controller: price,
                  validat: (val) {
                    return validate(val!, 3, 20, 'price');
                  },
                  lable_text: 'السعر',
                  suffixicone: Icons.money,
                  obsc: false),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  add();
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
        ),
      ),
    );
  }
}
