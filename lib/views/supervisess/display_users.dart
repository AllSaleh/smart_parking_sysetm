import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/widgts/text.dart';

class display_users extends StatelessWidget {
  display_users({super.key});

  display() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: text(
            title: 'عرض المستخدمين ',
            fontcolore: Colors.black,
            weight: FontWeight.bold,
            size: 25,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: ((context, i) {
            return Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Card(
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: text(
                            title: 'بيانات العميل',
                            size: 20,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 150,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/photo.jpg')))),
                          Column(
                            children: [
                              text(
                                title: 'علاء باقيمه',
                                fontcolore: Colors.black,
                                size: 20,
                              ),
                              text(
                                title: '777616028',
                                fontcolore: Colors.black,
                                size: 20,
                              ),
                              text(
                                title: 'المكلا/ فوه',
                                fontcolore: Colors.black,
                                size: 20,
                              ),
                              text(
                                title: '23500 ر.ي',
                                fontcolore: Colors.black,
                                size: 20,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              text(
                                title: ':الاسم',
                                fontcolore: Colors.grey,
                                size: 20,
                              ),
                              text(
                                title: ':رقم الجوال',
                                fontcolore: Colors.grey,
                                size: 20,
                              ),
                              text(
                                title: ':العنوان',
                                fontcolore: Colors.grey,
                                size: 20,
                              ),
                              text(
                                title: ':الرصيد',
                                fontcolore: Colors.grey,
                                size: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                      MaterialButton(
                        onPressed: (() async {
                          AwesomeDialog(
                                  dismissOnTouchOutside: false,
                                  context: context,
                                  dialogType: DialogType.question,
                                  showCloseIcon: true,
                                  isDense: false,
                                  transitionAnimationDuration:
                                      Duration(milliseconds: 500),
                                  dialogBackgroundColor: primcolor,
                                  btnOk: MaterialButton(
                                    onPressed: () {},
                                    child: Container(
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: text(
                                          title: 'موافق',
                                          fontcolore: Colors.black,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  descTextStyle: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                  desc: 'هل تود حظر العميل : علاء باقيمه')
                              .show();
                        }),
                        child: text(
                          title: 'حظر المستخدم',
                          fontcolore: Colors.red,
                          size: 25,
                        ),
                      )
                    ],
                  ),
                  height: MediaQuery.of(context).size.height / 3,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                ),
                shadowColor: primcolor,
                elevation: 20,
              ),
            );
          })),
    );
  }
}
