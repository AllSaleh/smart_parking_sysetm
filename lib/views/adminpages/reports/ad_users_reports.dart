import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/model/CRUD.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import 'package:smart_parking_project1/widgts/text.dart';

class ad_users_reports extends StatefulWidget {
  ad_users_reports({super.key});

  @override
  State<ad_users_reports> createState() => _ad_users_reportsState();
}

class _ad_users_reportsState extends State<ad_users_reports> with Crud {
  get_reports() async {
    var response = await getRequest(Applinks.Admin_userreports);

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              )),
          title: Align(
            alignment: Alignment.centerRight,
            child: text(
              title: 'تقارير المستخدمين',
              fontcolore: Colors.black,
              weight: FontWeight.bold,
              size: 25,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: FutureBuilder(
          future: get_reports(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data['s'] == 'f') {
                return Center(
                  child: text(
                    title: 'لايوجد عملاء',
                    size: 20,
                  ),
                );
              }

              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data['data'].length,
                  itemBuilder: ((context, i) {
                    return Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: Card(
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: text(
                                    title: 'بيانات العميل',
                                    size: 20,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      height: 150,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  '${Applinks.usersImaesLink}/${snapshot.data['data'][i]['user_pic']}')))),
                                  Column(
                                    children: [
                                      text(
                                        title:
                                            '${snapshot.data['data'][i]['user_name']}',
                                        fontcolore: Colors.black,
                                        size: 20,
                                      ),
                                      text(
                                        title:
                                            '${snapshot.data['data'][i]['user_phone']}',
                                        fontcolore: Colors.black,
                                        size: 20,
                                      ),
                                      text(
                                        title:
                                            '${snapshot.data['data'][i]['user_location']}',
                                        fontcolore: Colors.black,
                                        size: 20,
                                      ),
                                      text(
                                        title:
                                            'ر.ي ${snapshot.data['data'][i]['amount']}',
                                        fontcolore: Colors.black,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      text(
                                        title: ':الاسم',
                                        fontcolore: Colors.grey,
                                        size: 20,
                                      ),
                                      text(
                                        title: ':رقم الجوال',
                                        fontcolore: Colors.grey,
                                        size: 20,
                                      ),
                                      text(
                                        title: ':العنوان',
                                        fontcolore: Colors.grey,
                                        size: 20,
                                      ),
                                      text(
                                        title: ':الرصيد',
                                        fontcolore: Colors.grey,
                                        size: 20,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.height / 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        shadowColor: primcolor,
                        elevation: 20,
                      ),
                    );
                  }));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.asset('lotties/loading.json'),
              );
            } else {
              return Center(
                child: text(title: 'التأكد من اتصال الانترنت'),
              );
            }
          },
        ));
  }
}
