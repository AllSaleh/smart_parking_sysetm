import 'package:flutter/material.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/main.dart';
import 'package:smart_parking_project1/views/users_pages/booking.dart';

import 'package:smart_parking_project1/views/users_pages/profile.dart';
import 'package:smart_parking_project1/views/users_pages/search_booking.dart';
import 'package:smart_parking_project1/views/users_pages/add_blanc.dart';

class user_home extends StatefulWidget {
  user_home({super.key});

  @override
  State<user_home> createState() => _user_homeState();
}

class _user_homeState extends State<user_home> {
  @override
  void initState() {
    if (sharedPref.getInt('index_user') == null) {
      selectindex = 0;
    } else {
      selectindex = sharedPref.getInt('index_user')!;
    }
    super.initState();
  }

  var pages = [profile(), add_blanc(), booking(), search_booking()];

  int selectindex = 0;

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
                fontSize: 13, color: primcolor, fontWeight: FontWeight.bold),
            unselectedFontSize: 15,
            selectedItemColor: Colors.white,
            elevation: 30,
            iconSize: 20,
            type: BottomNavigationBarType.fixed,
            backgroundColor: primcolor,
            onTap: (index) {
              setState(() {
                sharedPref.setInt('index_user', index);
                selectindex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'الملف الشخصي'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.money_off_sharp), label: 'اضافة رصيد'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.report), label: 'الحجوزات'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'استعلام عن موقف')
            ]),
      ),
      body: pages.elementAt(selectindex),
    );
  }
}
