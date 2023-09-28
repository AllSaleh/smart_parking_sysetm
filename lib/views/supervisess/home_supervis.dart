import 'package:flutter/material.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/main.dart';
import 'package:smart_parking_project1/views/supervisess/add_amount.dart';
import 'package:smart_parking_project1/views/supervisess/display_users.dart';
import 'package:smart_parking_project1/views/supervisess/park_manage.dart';

import 'reports.dart';

class supervisess_home extends StatefulWidget {
  const supervisess_home({super.key});

  @override
  State<supervisess_home> createState() => _supervisess_homeState();
}

class _supervisess_homeState extends State<supervisess_home> {
  @override
  void initState() {
    if (sharedPref.getInt('super_index') == null) {
      selectedindex = 0;
    } else {
      selectedindex = sharedPref.getInt('super_index')!;
    }
    super.initState();
  }

  int selectedindex = 0;
  var pages = [display_users(), park_manage(), add_amount(), super_reports()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(15)),
          child: BottomNavigationBar(
              currentIndex: selectedindex,
              landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
              enableFeedback: true,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: TextStyle(
                  fontSize: 15,
                  //   color: Colors.white,
                  fontWeight: FontWeight.bold),
              unselectedFontSize: 15,
              selectedItemColor: Colors.white,
              elevation: 30,
              iconSize: 20,
              backgroundColor: primcolor,
              onTap: (index) {
                setState(() {
                  sharedPref.setInt('super_index', index);
                  selectedindex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: 'استعراض العملاء'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'المواقف'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.car_crash), label: 'طلبات الرصيد'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'التقارير '),
              ]),
        ),
      ),
      body: pages.elementAt(selectedindex),
    );
  }
}
