import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/model/CRUD.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import 'package:smart_parking_project1/views/users_pages/do_booking.dart';
import 'package:smart_parking_project1/widgts/text.dart';

import '../../main.dart';

class display_parking extends StatefulWidget with Crud {
  final String buildname;
  final int id;
  display_parking({super.key, required this.id, required this.buildname});

  @override
  State<display_parking> createState() => _display_parkingState();
}

class _display_parkingState extends State<display_parking> {
  var size = SizedBox(
    height: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: text(
              title: 'اختر موقفك',
              fontcolore: Colors.black,
              weight: FontWeight.bold,
              size: 25,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: (() {
                Get.back();
              }),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  button('الدور الثالث', Colors.white, primcolor),
                  button('الدور الثاني', Colors.white, primcolor),
                  button('الدور الاول', primcolor, Colors.white),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Divider(
                color: Color.fromRGBO(161, 161, 161, 1),
                thickness: 2,
                height: 2,
                indent: 50,
                endIndent: 50,
              ),
              size,
              Container(
                // color: defultcolors,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [cont(), size, cont(), size, cont2('105A')],
                    ),
                    Column(
                      children: [cont(), size, cont2('104A'), size, cont()],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
                child: Divider(
                  color: Color.fromRGBO(161, 161, 161, 1),
                  thickness: 2,
                  height: 2,
                  indent: 50,
                  endIndent: 50,
                ),
              ),
              Container(
                //color: defultcolors,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        cont(),
                        size,
                        cont2('103B'),
                        size,
                        cont2('105A')
                      ],
                    ),
                    Column(
                      children: [cont2('102B'), size, cont(), size, cont()],
                    )
                  ],
                ),
              ),
            ],
          ),
          size,
          Divider(
            color: Color.fromRGBO(161, 161, 161, 1),
            thickness: 2,
            height: 2,
            indent: 50,
            endIndent: 50,
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(do_booking(
                id: widget.id,
                buildname: widget.buildname,
              ));
            },
            child: text(
              title: 'حجز',
              size: 25,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(primcolor),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 145, vertical: 7)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

cont() {
  return Container(
    height: 50,
    width: 100,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('images/c1.png')),
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

cont2(String title) {
  return Container(
    child: Center(
      child: text(title: title),
    ),
    height: 45,
    width: 100,
    decoration: BoxDecoration(
      border: Border.all(
        color: Color.fromRGBO(188, 0, 99, 1),
      ),
      color: Color.fromRGBO(188, 0, 99, .2),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

button(String title, Color colors, Color foncolor) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: primcolor),
        borderRadius: BorderRadius.circular(25)),
    child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(10),
          shadowColor: MaterialStateProperty.all(primcolor),
          backgroundColor: MaterialStateProperty.all(colors),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        onPressed: (() {}),
        child: text(
          title: title,
          fontcolore: foncolor,
          weight: FontWeight.bold,
          size: 16,
        )),
  );
}
