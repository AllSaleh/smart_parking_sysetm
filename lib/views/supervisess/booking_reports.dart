import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:smart_parking_project1/widgts/listtile.dart';

import '../../cons/color.dart';
import '../../widgts/text.dart';

class booking_reporst extends StatefulWidget {
  booking_reporst({super.key});

  @override
  State<booking_reporst> createState() => _booking_reporstState();
}

class _booking_reporstState extends State<booking_reporst> {
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
              title: 'تقارير الحجوزات',
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
      body: ListView.builder(
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
                            title: '4 ساعات',
                            fontcolore: Colors.black,
                            size: 20,
                          ),
                          size,
                          size,
                          text(
                            title: '4:00 pm ',
                            fontcolore: Colors.black,
                            size: 20,
                          ),
                          size,
                          size,
                          text(
                            title: '12:00 am ',
                            fontcolore: Colors.black,
                            size: 20,
                          )
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
                ),
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: primcolor, strokeAlign:BorderSide.strokeAlignOutside ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
