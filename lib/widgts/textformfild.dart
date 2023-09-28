import 'package:flutter/material.dart';

class Textformfiled extends StatelessWidget {
  final TextEditingController? controller;
  final bool? enabl;
  final String lable_text;
  final TextInputType? textinput;
  final bool obsc;
  final String? Function(String?)? validat;
  final IconData suffixicone;
  final Widget? prefxicon;
  const Textformfiled(
      {super.key,
      required this.lable_text,
      required this.suffixicone,
      this.prefxicon,
      required this.obsc,
      this.validat,
      this.textinput,
      this.enabl,
      this.controller});

  @override
  Widget build(BuildContext context) {
    bool oncha = false;
    return Container(
      padding:const EdgeInsets.only(top: 5, right: 8, left: 8),
      child: TextFormField(
          enabled: enabl,
          controller: controller,
          keyboardType: textinput,
          validator: validat,
          obscureText: obsc,
         // autovalidateMode: AutovalidateMode.onUserInteraction,
          textAlign: TextAlign.right,
          cursorColor: Colors.black,
          cursorHeight: 30,
          decoration: InputDecoration(
            filled: true,
            fillColor:const Color.fromRGBO(217, 217, 217, 50),
            focusColor: Colors.black,
            focusedBorder:
            const    OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            prefixIcon: prefxicon,
            suffixIcon: Icon(
              suffixicone,
              color: const Color.fromRGBO(169, 169, 169, 1),
            ),
            label: Align(
              alignment: Alignment.centerRight,
              child: Text(
                lable_text,
                style: const TextStyle(
                    color: Color.fromRGBO(146, 135, 135, 1), fontSize: 19),
              ),
            ),
            errorStyle:const TextStyle(color: Colors.black, fontSize: 15),
           
            enabledBorder: UnderlineInputBorder(
                borderSide:const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
          )),
    );
  }
}
