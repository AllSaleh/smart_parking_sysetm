import 'package:flutter/material.dart';

class edit_supervise extends StatefulWidget {
  const edit_supervise({super.key});

  @override
  State<edit_supervise> createState() => _edit_superviseState();
}

class _edit_superviseState extends State<edit_supervise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text('تعديل مشرف'),
        ),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Text('data');
        },
      ),
    );
  }
}
