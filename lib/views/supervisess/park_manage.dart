import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_project1/views/adminpages/bulid_mange/display_building.dart';
import 'package:smart_parking_project1/views/supervisess/add_park.dart';
import 'package:smart_parking_project1/views/supervisess/display_parks.dart';

import 'package:smart_parking_project1/widgts/textformfild.dart';

import '../../widgts/text.dart';

class park_manage extends StatelessWidget {
  park_manage({super.key});
  var _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/parking.png'), fit: BoxFit.fill)),
        ),
        Positioned(
          top: 60,
          child: Padding(
            padding: EdgeInsets.only(left: 22),
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
                      return display_parks();
                    }));
                    Navigator.push(context, route);
                  }),
                  child: text(
                    title: 'عرض المواقف',
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
                      return add_park();
                    }));
                    Navigator.push(context, route);
                  }),
                  child: text(
                    title: 'اضافة موقف',
                    size: 20,
                    weight: FontWeight.bold,
                  )),
            ]),
          ),
        )
      ]),
    );
  }
}
