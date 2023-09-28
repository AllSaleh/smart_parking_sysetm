import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_parking_project1/test.dart';

import './splash_screen.dart';

late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const smart_parking());
}

class smart_parking extends StatelessWidget {
  const smart_parking({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:

              splash_screen()
      //   test()
            );
  }
}

class thems {
  static ThemeData customlight = ThemeData.light().copyWith(
      textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)));
  static ThemeData customdark = ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(color: Colors.blue),
      textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)));
}
