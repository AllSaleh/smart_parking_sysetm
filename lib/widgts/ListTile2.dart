import 'package:flutter/material.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/widgts/text.dart';

class ListTile2 extends StatelessWidget {
  final void Function()? ontap;
  final IconData trilingicons;

  final Widget? triling;

  final String title;
  const ListTile2(
      {super.key,
      this.triling,
      required this.title,
  
      required this.trilingicons,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.only(top: 6),
        child: ListTile(
          title: Align(
              alignment: Alignment.bottomRight,
              child: text(
                title: title,
                size: 20,
                fontcolore: Colors.black,
              )),
          trailing: Icon(
            trilingicons,
            color: Color.fromRGBO(161, 161, 161, 1),
          ),
        ),
      ),
    );
  }
}
