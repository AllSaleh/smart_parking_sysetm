import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_project1/views/adminpages/bulid_mange/add_build.dart';
import 'package:smart_parking_project1/views/adminpages/bulid_mange/display_building.dart';
import 'package:smart_parking_project1/widgts/text.dart';
import '../admin_log.dart';

class bulid_home extends StatefulWidget {
  const bulid_home({super.key});

  @override
  State<bulid_home> createState() => _bulid_homeState();
}

class _bulid_homeState extends State<bulid_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/map.jpg'), fit: BoxFit.cover)),
        ),
        Positioned(
          top: 80,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                          ),
                        ),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(229, 93, 76, 1))),
                    onPressed: (() {
                      Get.to(display_build());
                    }),
                    child: const text(
                      title: 'عرض المباني',
                      size: 20,
                      weight: FontWeight.bold,
                    )),
                const SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
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
                      Get.to(add_build());
                    }),
                    child: text(
                      title: 'اضافة مبنى',
                      size: 20,
                      weight: FontWeight.bold,
                    )),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
