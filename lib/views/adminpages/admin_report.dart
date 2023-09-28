import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/main.dart';
import 'package:smart_parking_project1/views/adminpages/reports/ad_mony_reports.dart';
import 'package:smart_parking_project1/views/adminpages/reports/ad_users_reports.dart';
import 'package:smart_parking_project1/views/supervisess/booking_reports.dart';
import 'package:smart_parking_project1/views/supervisess/mony_reoprts.dart';
import 'package:smart_parking_project1/views/supervisess/users_reports.dart';

import '../../widgts/text.dart';
import '../userpages/authpages/login_page.dart';

class admin_report extends StatelessWidget {
  const admin_report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: (() {
                sharedPref.clear();
                Get.offAll(Loginpage());
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    icone(Icons.person, 'المستخدمين', (() {
                      var route = MaterialPageRoute(builder: ((context) {
                        return ad_users_reports();
                      }));
                      Navigator.push(context, route);
                    })),
                    icone(Icons.money, 'الايرادات', () {
                      var route = MaterialPageRoute(builder: ((context) {
                        return ad_money_reports();
                      }));
                      Navigator.push(context, route);
                    }),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
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
