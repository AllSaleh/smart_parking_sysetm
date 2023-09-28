import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/main.dart';
import 'package:smart_parking_project1/views/adminpages/bulid_mange/bulild_home.dart';
import 'package:smart_parking_project1/views/adminpages/admin_report.dart';
import 'package:smart_parking_project1/views/adminpages/supervisess.dart';
import 'package:smart_parking_project1/views/supervisess/reports.dart';

class admin_home extends StatefulWidget {
  const admin_home({super.key});

  @override
  State<admin_home> createState() => _admin_homeState();
}

class _admin_homeState extends State<admin_home> {
  @override
  void initState() {
    if (sharedPref.getInt('index') == null) {
      selectindex = 0;
    } else {
      selectindex = sharedPref.getInt('index')!;
    }
    super.initState();
  }

  var selectindex = 0;
  List pages = [bulid_home(), suypervisess(), admin_report()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(15)),
        child: BottomNavigationBar(
            currentIndex: selectindex,
            mouseCursor: MouseCursor.uncontrolled,
            landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
            enableFeedback: true,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedLabelStyle: TextStyle(
                fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
            unselectedFontSize: 15,
            selectedItemColor: Colors.white,
            elevation: 30,
            iconSize: 25,
            type: BottomNavigationBarType.fixed,
            backgroundColor: primcolor,
            onTap: (index) {
              setState(() {
                selectindex = index;
                sharedPref.setInt('index', index);
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'ادارة المباني'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.money_off_sharp), label: 'ادارة المشرفين'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.report), label: 'التقارير'),
            ]),
      ),
      body: pages.elementAt(selectindex),
    );
  }
}
