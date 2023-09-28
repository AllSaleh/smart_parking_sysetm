import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/model/CRUD.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import 'package:lottie/lottie.dart';

import '../../../widgts/text.dart';

class display_build extends StatefulWidget {
  const display_build({super.key});

  @override
  State<display_build> createState() => _display_buildState();
}

class _display_buildState extends State<display_build> with Crud {
  var size = const SizedBox(
    height: 10,
  );

  display_building() async {
    var response = await getRequest(Applinks.Admin_display_builds);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: text(
              title: 'عرض المباني ',
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
      body: FutureBuilder(
        future: display_building(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data['s'] == 'f') {
              return const Center(
                child: text(
                  title: 'لايوجد مباني',
                  size: 20,
                  weight: FontWeight.bold,
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data['data'].length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(top: 30, left: 15, right: 15),
                  child: Card(
                    elevation: 20,
                    shadowColor: primcolor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      text(
                                        title:
                                            '${snapshot.data['data'][index]['bulding_name']}',
                                        fontcolore: Colors.black,
                                        size: 20,
                                      ),
                                      size,
                                      text(
                                        title:
                                            '${snapshot.data['data'][index]['bulding_location']}',
                                        fontcolore: Colors.black,
                                        size: 20,
                                      ),
                                      size,
                                      size,
                                      text(
                                        title:
                                            '${snapshot.data['data'][index]['super_name']}',
                                        fontcolore: Colors.black,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      text(
                                        title: ':المبنى',
                                        fontcolore: Colors.grey,
                                        size: 20,
                                      ),
                                      size,
                                      text(
                                        title: ':العنوان ',
                                        fontcolore: Colors.grey,
                                        size: 20,
                                      ),
                                      size,
                                      text(
                                        title: ':المشرف ',
                                        fontcolore: Colors.grey,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: (() async {
                                    var response = await postRequst(
                                        Applinks.Admin_delete_build, {
                                      'id': snapshot.data['data'][index]
                                              ['bulding_id']
                                          .toString()
                                    });
                                    if (response['s'] == 's') {
                                      Get.snackbar('تمت الحذف',
                                          'تم حذف هذا المبنى بنجاح',
                                          icon: Icon(
                                            Icons.done,
                                            color: Colors.green,
                                            size: 30,
                                          ));
                                    }

                                    setState(() {});
                                  }),
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 35,
                                  ))
                            ],
                          ),
                        ),
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(244, 244, 244, 1)),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset('lotties/loading.json'),
            );
          } else {
            return Center(
              child: text(title: 'No conect with internet'),
            );
          }
        },
      ),
    );
  }
}
