import 'package:flutter/material.dart';
import 'package:smart_parking_project1/cons/color.dart';

class listtile extends StatelessWidget {
  final void Function()? onpress;
  final IconData? icon;
  final void Function()? ontap;

  final String trilingtext;
  final String title;
  const listtile(
      {super.key,
      required this.trilingtext,
      required this.title,

      this.ontap,
      this.onpress,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        child: ListTile(
          leading: IconButton(onPressed: onpress, icon: Icon(icon)),
          trailing: Text(
            trilingtext,
            style: TextStyle(fontSize: 20, color: textcolors),
          ),
          title: Align(alignment: Alignment.centerRight, child: Text(title)),
        ),
      ),
    );
  }
}
