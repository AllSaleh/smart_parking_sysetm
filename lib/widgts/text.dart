import 'package:flutter/material.dart';

class text extends StatelessWidget {
  final FontWeight? weight;
  final TextAlign? alint;
  final double? size;
  final String title;
  final Color? fontcolore;
  const text(
      {super.key,
      required this.title,
      this.size,
      this.fontcolore,
      this.weight, this.alint});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: size,
        color: fontcolore,
        fontWeight: weight,
      ),
      textAlign: alint,
    );
  }
}
