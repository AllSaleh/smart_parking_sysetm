import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/model/CRUD.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import '../../../widgts/text.dart';

class ad_money_reports extends StatefulWidget {
  ad_money_reports({super.key});

  @override
  State<ad_money_reports> createState() => _ad_money_reportsState();
}

class _ad_money_reportsState extends State<ad_money_reports> with Crud {
  display_moneyReports() async {
    var response = await getRequest(Applinks.Admin_moneyreports);
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
              title: 'تقارير الايرادات',
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
        future: display_moneyReports(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data['s'] == 'f') {
              return const Center(
                child: text(
                  title: 'لايوجد تقارير',
                  size: 20,
                  weight: FontWeight.bold,
                ),
              );
            }
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Card(
                    elevation: 20,
                    shadowColor: primcolor,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                text(
                                  title: 'مبارك لقوح',
                                  fontcolore: Colors.black,
                                  size: 20,
                                ),
                                size,
                                text(
                                  title: 'رئاسة الجامعه',
                                  fontcolore: Colors.black,
                                  size: 20,
                                ),
                                size,
                                text(
                                  title: '103B',
                                  fontcolore: Colors.black,
                                  size: 20,
                                ),
                                size,
                                size,
                                text(
                                  title: '2023/6/29',
                                  fontcolore: Colors.black,
                                  size: 20,
                                ),
                                size,
                                size,
                                text(
                                  title: '2000',
                                  fontcolore: Colors.black,
                                  size: 20,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                text(
                                  title: ':اسم العميل',
                                  fontcolore: Colors.grey,
                                  size: 20,
                                ),
                                size,
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
                                  title: ':تاريخ الحجز',
                                  fontcolore: Colors.grey,
                                  size: 20,
                                ),
                                size,
                                text(
                                  title: ':المبلغ ',
                                  fontcolore: Colors.grey,
                                  size: 20,
                                ),
                                size,
                              ],
                            ),
                          ],
                        ),
                      ),
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: primcolor, strokeAlign: BorderSide.strokeAlignOutside),
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
