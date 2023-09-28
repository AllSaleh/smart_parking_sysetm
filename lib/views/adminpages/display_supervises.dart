import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/cons/warning.dart';
import 'package:smart_parking_project1/model/CRUD.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import 'package:smart_parking_project1/widgts/listtile.dart';
import '../../../widgts/text.dart';

class display_supervisess extends StatefulWidget {
  const display_supervisess({super.key});

  @override
  State<display_supervisess> createState() => _display_supervisessState();
}

class _display_supervisessState extends State<display_supervisess> with Crud {
  var size = SizedBox(
    height: 10,
  );

  display_supers() async {
    var response = await getRequest(Applinks.Admin_display_supers);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Align(
              alignment: Alignment.centerRight,
              child: text(
                title: 'عرض المشرفين ',
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
          future: display_supers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data['s'] == 'f') {
                return const Center(
                  child: text(
                    title: 'لايوجد مشرفين',
                    size: 25,
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data['data'].length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Card(
                        elevation: 10,
                        shadowColor: primcolor,
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
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
                                              '${snapshot.data['data'][index]['super_name']} ',
                                          fontcolore: Colors.black,
                                          size: 20,
                                        ),
                                        size,
                                        text(
                                          title:
                                              '${snapshot.data['data'][index]['super_address']} ',
                                          fontcolore: Colors.black,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        text(
                                          title: ':المشرف',
                                          fontcolore: Colors.grey,
                                          size: 20,
                                        ),
                                        size,
                                        text(
                                          title: ':العنوان',
                                          fontcolore: Colors.grey,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: (() async {
                                      waring_deleting(context, (() async {
                                        var rsponsess = await postRequst(
                                            Applinks.Admin_delete_super, {
                                          'id': snapshot.data['data'][index]
                                                  ['super_id']
                                              .toString()
                                        });
                                        if (rsponsess['s'] == 's') {
                                          Get.snackbar('تمت الحذف',
                                              'تم حذف هذا المشرف بنجاح',
                                              icon: Icon(
                                                Icons.done,
                                                color: Colors.green,
                                                size: 30,
                                              ));
                                        }
                                        setState(() {});
                                        print(rsponsess);
                                      }));
                                    }),
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 35,
                                    ))
                              ],
                            ),
                          ),
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                        )),
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
        ));
  }
}
