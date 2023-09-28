import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_parking_project1/main.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import 'package:smart_parking_project1/widgts/text.dart';

import '../../cons/color.dart';
import '../../model/CRUD.dart';

class booking extends StatefulWidget {
  booking({super.key});

  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> with Crud {
  var _long;
  display_booking() async {
    var response = await getRequest(
        '${Applinks.displaybooking_link}?id=${sharedPref.getString('user_id')}');
    return response;
  }

  var size = SizedBox(
    height: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Align(
              alignment: Alignment.centerRight,
              child: text(
                title: 'عرض حجوزاتي',
                fontcolore: Colors.black,
                weight: FontWeight.bold,
              ),
            )),
        body: FutureBuilder(
            future: display_booking(),
            builder: ((BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data['s'] == 'f') {
                  return Center(
                    child: text(
                      title: 'لايوجد حجوزات',
                      size: 25,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data['data'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Card(
                        elevation: 10,
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
                                              '${snapshot.data['data'][index]['time']}',
                                          fontcolore: Colors.black,
                                          size: 20,
                                        ),
                                        size,
                                        size,
                                        text(
                                          title:
                                              '${snapshot.data['data'][index]['to'] - snapshot.data['data'][index]['from']} ساعات',
                                          fontcolore: Colors.black,
                                          size: 20,
                                        ),
                                        size,
                                        size,
                                        text(
                                          title:
                                              '${snapshot.data['data'][index]['from']}:00 ',
                                          fontcolore: Colors.black,
                                          size: 20,
                                        ),
                                        size,
                                        size,
                                        text(
                                          title:
                                              '${snapshot.data['data'][index]['to']}:00 ',
                                          fontcolore: Colors.black,
                                          size: 20,
                                        )
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
                                          title: ':رقم الموقف',
                                          fontcolore: Colors.grey,
                                          size: 20,
                                        ),
                                        size,
                                        text(
                                          title: ':تاريخ اليوم',
                                          fontcolore: Colors.grey,
                                          size: 20,
                                        ),
                                        size,
                                        text(
                                          title: ':المده ',
                                          fontcolore: Colors.grey,
                                          size: 20,
                                        ),
                                        size,
                                        text(
                                          title: ':من ',
                                          fontcolore: Colors.grey,
                                          size: 20,
                                        ),
                                        size,
                                        text(
                                          title: ':الى ',
                                          fontcolore: Colors.grey,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          height: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: primcolor,
                               // strokeAlign: StrokeAlign.outside
                                ),
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
            })));
  }
}
