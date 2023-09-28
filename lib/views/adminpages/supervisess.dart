import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/views/adminpages/add_supervise.dart';

import '../../widgts/text.dart';
import '../../widgts/textformfild.dart';
import 'display_supervises.dart';

class suypervisess extends StatelessWidget {
  const suypervisess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/d.jpg'))),
      
            ),
            Positioned
            (
              top: 60,
              
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 5, horizontal: 30)),
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(229, 93, 76, 1))),
                onPressed: (() {
                  var route = MaterialPageRoute(builder: ((context) {
                    return display_supervisess();
                  }));
                  Navigator.push(context, route);
                }),
                child: text(
                  title: 'عرض المشرفين',
                  size: 20,
                  weight: FontWeight.bold,
                )),
            SizedBox(
              width: 40,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 5, horizontal: 30)),
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(229, 93, 76, 1))),
                onPressed: (() {
                  var route = MaterialPageRoute(builder: ((context) {
                    return add_supervis();
                  }));
                  Navigator.push(context, route);




                }),
                child: text(
                  title: 'اضافة مشرف',
                  size: 20,
                  weight: FontWeight.bold,
                )),
          ]),)
          ],
        ),
      ),
    );
  }
}
