// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:smart_parking_project1/views/userpages/authpages/home_signup.dart';
import 'package:smart_parking_project1/views/userpages/authpages/login_page.dart';
import 'package:smart_parking_project1/widgts/text.dart';

import 'cons/color.dart';

class data {
  final String image;
  final String des;
  data({
    required this.image,
    required this.des,
  });
}

class p_view extends StatefulWidget {
  const p_view({super.key});

  @override
  State<p_view> createState() => _p_viewState();
}

class _p_viewState extends State<p_view> {
  final PageController _controller = PageController();
  int _val = 0;

  List<data> mydata = [
    data(image: 'images/s1.png', des: 'اوجد المواقف من حولك بسهوله'),
    data(image: 'images/s3.png', des: 'احجز موقف سيارتك بسرعه وسهوله'),
    data(image: 'images/s2.png', des: 'مدد حجزك حسب ماتريد')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          dragStartBehavior: DragStartBehavior.down,
          pageSnapping: true,
          controller: _controller,
          children: mydata
              .map((i) => SingleChildScrollView(
                child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 600,
                          height: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('${i.image}')),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        text(
                          title: '${i.des}',
                          weight: FontWeight.bold,
                          size: 25,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ciarcl(
                          index: _val,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        _val == 2
                            ? ElevatedButton(
                                onPressed: () {
                                  var route =
                                      MaterialPageRoute(builder: ((context) {
                                    return Loginpage();
                                  }));
                                  Navigator.pushAndRemoveUntil(
                                      context, route, (route) => false);
                                },
                                child: text(
                                  title: 'لنبدأ',
                                  size: 20,
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(primcolor),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          horizontal: 100, vertical: 10)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ),
                              )
                            : text(title: ''),
                       const SizedBox(
                          height: 20,
                        ),
                        _val == 2
                            ? const text(title: '')
                            : ElevatedButton(
                                onPressed: () {
                                  var route =
                                      MaterialPageRoute(builder: ((context) {
                                    return Loginpage();
                                  }));
                                  Navigator.pushAndRemoveUntil(
                                      context, route, (route) => false);
                                },
                                child:const text(
                                  title: 'تخطي',
                                  size: 20,
                                  fontcolore: primcolor,
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          horizontal: 100, vertical: 10)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
              ))
              .toList(),
          onPageChanged: (value) {
            _val = value;
            setState(() {});
          },
        ),
      ),
    );
  }
}

class ciarcl extends StatelessWidget {
  final int index;
  const ciarcl({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ciarcle(index == 0 ? primcolor : Colors.white),
     const   SizedBox(
          width: 10,
        ),
        ciarcle(index == 1 ? primcolor : Colors.white),
      const  SizedBox(
          width: 10,
        ),
        ciarcle(index == 2 ? primcolor : Colors.white)
      ],
    );
  }

   ciarcle(Color color) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          border: Border.all(color: primcolor),
          color: color,
          shape: BoxShape.circle),
    );
  }
}
