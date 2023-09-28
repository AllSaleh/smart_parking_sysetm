import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:smart_parking_project1/PViwe.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/views/supervisess/home_supervis.dart';
import 'package:smart_parking_project1/views/userpages/user_home.dart';

import 'main.dart';

class splash_screen extends StatelessWidget {
  const splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      backgroundImage: AssetImage('images/logo.png'),
      logo: Image(
        image: AssetImage('images/g.png'),
      ),
      backgroundColor: primcolor,
      navigator:
           p_view() ,
      durationInSeconds: 3,
      showLoader: true,
      loaderColor: Colors.white,
      logoWidth: 0,
      loadingText: Text(
        '.....يتم التحميل',
        style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
