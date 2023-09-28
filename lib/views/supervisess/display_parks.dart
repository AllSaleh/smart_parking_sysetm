import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_parking_project1/cons/emptys.dart';
import 'package:smart_parking_project1/main.dart';
import 'package:smart_parking_project1/model/CRUD.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import 'package:smart_parking_project1/widgts/listtile.dart';

import '../../cons/color.dart';
import '../../widgts/text.dart';

class display_parks extends StatefulWidget {
  display_parks({super.key});

  @override
  State<display_parks> createState() => _display_parksState();
}

class _display_parksState extends State<display_parks> with Crud {
  display_parkss() async {
    var response = await getRequest(
        '${Applinks.display_park_super}?id=${sharedPref.getString('super_id')}');
    return response;
  }

  var size = SizedBox(
    height: 10,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: text(
              title: ' عرض المواقف ',
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
        future: display_parkss(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data['s'] == 'f') {
              return const Center(
                child: text(
                  title: 'لايوجد مواقف ',
                  size: 25,
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data['data'].length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Card(
                      elevation: 20,
                      shadowColor: primcolor,
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
                                            '${snapshot.data['data'][index]['parking_no']}',
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
                                      size,
                                      size,
                                      text(
                                        title:
                                            '${snapshot.data['data'][index]['price_parking']}',
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
                                        title: ':رقم الموقف ',
                                        fontcolore: Colors.grey,
                                        size: 20,
                                      ),
                                      size,
                                      text(
                                        title: ':المشرف ',
                                        fontcolore: Colors.grey,
                                        size: 20,
                                      ),
                                      size,
                                      text(
                                        title: ':السعر ',
                                        fontcolore: Colors.grey,
                                        size: 20,
                                      ),
                                      size,
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: (() async {
                                    if (snapshot.data['data'][index]
                                            ['is_avalible'] ==
                                        1) {
                                      return empty_image(
                                          'هذا الموقف محجوز ولايمكن حذفه',
                                          Icons.error);
                                    }
                                    var response = await postRequst(
                                        Applinks.delete_park_super, {
                                      'id': snapshot.data['data'][index]
                                              ['parking_id']
                                          .toString()
                                    });
                                    setState(() {});

                                    print(response);
                                  }),
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 30,
                                  ))
                            ],
                          ),
                        ),
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(244, 244, 244, 1)),
                      ),
                    ),
                  ),
                );
              }),
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
      ),
    );
  }
}
