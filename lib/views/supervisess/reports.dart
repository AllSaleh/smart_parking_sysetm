import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/main.dart';
import 'package:smart_parking_project1/views/supervisess/booking_reports.dart';
import 'package:smart_parking_project1/views/supervisess/mony_reoprts.dart';
import 'package:smart_parking_project1/views/supervisess/users_reports.dart';

import '../../widgts/text.dart';
import '../userpages/authpages/login_page.dart';

class super_reports extends StatelessWidget {
  const super_reports({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: (() {
                Get.offAll(Loginpage());
                sharedPref.clear();
              }),
              icon: Icon(
                Icons.logout,
                color: primcolor,
                size: 30,
              )),
          title: Align(
            alignment: Alignment.centerRight,
            child: text(
              title: 'التقارير',
              fontcolore: Colors.black,
              weight: FontWeight.bold,
              size: 25,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Image.asset('images/report.png'),
            SizedBox(
              height: 60,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    icone(Icons.money, 'الايرادات', () {
                      var route = MaterialPageRoute(builder: ((context) {
                        return money_reports();
                      }));
                      Navigator.push(context, route);
                    }),
                    SizedBox(
                      width: 100,
                    ),
                    icone(Icons.local_parking_rounded, 'الحجوزات', (() {
                      var route = MaterialPageRoute(builder: ((context) {
                        return booking_reporst();
                      }));
                      Navigator.push(context, route);
                    })),
                    SizedBox(
                      width: 100,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment(0, 0),
                  child: icone(Icons.person, 'المستخدمين', (() {
                    var route = MaterialPageRoute(builder: ((context) {
                      return users_reports();
                    }));
                    Navigator.push(context, route);
                  })),
                )
              ],
            )
          ],
        ));
  }

  icone(IconData icon, String title, void Function()? ontap) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          Icon(
            icon,
            color: primcolor,
            size: 40,
          ),
          SizedBox(
            height: 10,
          ),
          text(
            title: title,
            size: 20,
            fontcolore: Colors.black,
            weight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
