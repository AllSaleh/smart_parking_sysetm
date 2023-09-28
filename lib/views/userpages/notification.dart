import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/main.dart';
import 'package:smart_parking_project1/model/CRUD.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import 'dart:ui';
import '../../widgts/text.dart';

class notifcation extends StatefulWidget {
  const notifcation({super.key});

  @override
  State<notifcation> createState() => _notifcationState();
}

class _notifcationState extends State<notifcation> with Crud {
  display_notification() async {
    var response = await getRequest(
        '${Applinks.display_notification}?id=${sharedPref.getString('user_id')}');

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: primcolor,
              )),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Align(
            alignment: Alignment.centerRight,
            child: text(
              title: 'عرض الاشعارات',
              fontcolore: Colors.black,
              weight: FontWeight.bold,
            ),
          )),
      body: Container(
          height: 700,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.black,
                grey,
              ])),
          child: FutureBuilder(
            future: display_notification(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data['s'] == 'f') {
                  return const Center(
                    child: text(
                      title: 'لايوجد اشعارات',
                      size: 25,
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ListView.builder(
                    itemCount: snapshot.data['data'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          decoration: BoxDecoration(
                              color: grey,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20, right: 20),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: text(
                                    title:
                                        'تاريخ الاشعار ${snapshot.data['data'][index]['time']}',
                                    size: 15,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: ListTile(
                                  trailing: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: snapshot.data['data']
                                                [index]['order_status'] ==
                                            0
                                        ? AssetImage('images/reject.png')
                                        : AssetImage('images/accept.png'),
                                  ),
                                  title: Align(
                                    alignment: Alignment.centerRight,
                                    child: text(
                                      title: snapshot.data['data'][index]
                                                  ['order_status'] ==
                                              0
                                          ? 'تم رفض طلبك'
                                          : 'تمت الاضافه بنجاح',
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Align(
                                    alignment: Alignment.centerRight,
                                    child: text(
                                        title:
                                            'رصيد السابق ${snapshot.data['data'][index]['price']}\nرصيدك الحالي ${snapshot.data['data'][index]['new_price']}'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
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
          )),
    );
  }
}
