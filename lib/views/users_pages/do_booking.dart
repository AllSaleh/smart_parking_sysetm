import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/cons/emptys.dart';
import 'package:smart_parking_project1/model/CRUD.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import 'package:smart_parking_project1/views/userpages/user_home.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../main.dart';
import '../../widgts/text.dart';

class do_booking extends StatefulWidget {
  final String buildname;
  final int id;
  do_booking({super.key, required this.id, required this.buildname});

  @override
  State<do_booking> createState() => _do_bookingState();
}

class _do_bookingState extends State<do_booking> with Crud {
  displays() async {
    var response = await getRequest(
        '${Applinks.display_parks}/?id=${widget.id}&id_user=${sharedPref.getString('user_id')}');
    return response;
  }

  bool loading = false;

  do_booking() async {
    if (_amount < _new_price) {
      return empty_image('رصيدك غيرك كافي', Icons.error);
    }
    loading = true;
    var response = await postRequst(Applinks.do_booking, {
      'from': _from.toString(),
      'to': _to.toString(),
      'hours': _hours.toString(),
      'user_id': sharedPref.getString('user_id').toString(),
      'amount': _new_price.toString(),
      'park_id': _id_park.toString()
    });
    loading = false;
    if (response['s'] == 's') {
      Get.offAll(user_home());
    } else {}
  }

  var size = SizedBox(
    height: 10,
  );
  var _selecteditem;

  DateTime _currentDate = DateTime.now();

  void initState() {
    super.initState();
    Timer.periodic(Duration(days: 1), (Timer t) => _getCurrentDate());
  }

  void _getCurrentDate() {
    setState(() {
      _currentDate = DateTime.now();
    });
  }

  List<int> hours = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23
  ];
  var _selectedDay;
  var _calendarFormat;
  var _focusedDay;
  var _from;
  var _to;
  var _park;
  var _selectedpark;
  var _hours;
  var _price;
  var _total;
  var _amount;
  var _id_park;
  var _new_price;
  var _park_name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: text(
              title: 'حجز موقف',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromRGBO(243, 243, 243, 1)),
                child: TableCalendar(
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  // calendarFormat: _calendarFormat,
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay =
                          focusedDay; // update `_focusedDay` here as well
                    });
                  },
                  firstDay: DateTime.now(),
                  lastDay: DateTime.now(),
                  focusedDay: DateTime.now(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            text(
              title:
                  '${_currentDate.year}-${_currentDate.month}-${_currentDate.day}',
              size: 20,
              fontcolore: primcolor,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  child: Center(
                    child: DropdownButton<int>(
                      focusColor: Colors.white,
                      hint: text(
                        title: ' وقت الانتهاء',
                        size: 20,
                        fontcolore: primcolor,
                      ),
                      icon: Icon(
                        Icons.timelapse,
                        color: primcolor,
                        size: 30,
                      ),
                      onChanged: (value) {
                        if (_selectedpark == null) {
                          return empty_image(
                              'الرجاء اختيار الموقف اولا', Icons.error);
                        }
                        if (_from == null) {
                          return empty_image(
                              'الرجاء اختيار وقت البدء اولا', Icons.error);
                        }

                        if (_from == null) {
                          return empty_image(
                              'الرجاء اختيار وقت البدء', Icons.error);
                        }
                        _to = value;
                        if (_to <= _from) {
                          return empty_image('خطا في توقيت الحجز', Icons.error);
                        }

                        _hours = _to - _from;
                        _total = _price * _hours;
                        _new_price = _amount - _total;
                        print(_new_price);
                        setState(() {});
                      },
                      value: _to,
                      items: hours.map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: text(
                                title: '${value}',
                                fontcolore: primcolor,
                                size: 20,
                                weight: FontWeight.bold,
                              )),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  child: Center(
                    child: DropdownButton<int>(
                      focusColor: Colors.white,
                      hint: text(
                        title: ' وقت البدء',
                        size: 20,
                        fontcolore: primcolor,
                      ),
                      icon: Icon(
                        Icons.timelapse,
                        color: primcolor,
                        size: 30,
                      ),
                      onChanged: (value) {
                        if (_selectedpark == null) {
                          return empty_image(
                              'الرجاء اختيار الموقف اولا', Icons.error);
                        }
                        setState(() {});
                        _from = value;
                      },
                      value: _from,
                      items: hours.map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: text(
                                title: '${value}',
                                fontcolore: primcolor,
                                size: 20,
                                weight: FontWeight.bold,
                              )),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
                onPressed: (() {
                  Get.bottomSheet(
                      SafeArea(
                        child: Center(
                          child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        primcolor,
                                        grey,
                                      ]),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 70,
                                  ),
                                  text(
                                    title: 'اختيار الموقف',
                                    size: 25,
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  FutureBuilder(
                                    future: displays(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        if (snapshot.data['s'] == 'f') {
                                          return const Center(
                                            child: text(
                                              title: 'لايوجد مواقف متاحه',
                                              size: 25,
                                            ),
                                          );
                                        }
                                        return GridView.builder(
                                          shrinkWrap: true,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                          ),
                                          itemCount:
                                              snapshot.data['data'].length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () {
                                                _park_name =
                                                    snapshot.data['data'][index]
                                                        ['parking_no'];
                                                _id_park = snapshot.data['data']
                                                    [index]['parking_id'];
                                                _amount = snapshot.data['data2']
                                                    ['amount'];
                                                _price = snapshot.data['data']
                                                    [index]['price_parking'];
                                                _selectedpark =
                                                    snapshot.data['data'][index]
                                                        ['parking_no'];

                                                Get.back();
                                                setState(() {});
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 20,
                                                    right: 20,
                                                    left: 20),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          Colors.black,
                                                          primcolor,
                                                        ]),
                                                  ),
                                                  child: Center(
                                                      child: text(
                                                    title:
                                                        '${snapshot.data['data'][index]['parking_no']}',
                                                    fontcolore: grey,
                                                    size: 20,
                                                    weight: FontWeight.bold,
                                                  )),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: Lottie.asset(
                                              'lotties/loading.json'),
                                        );
                                      } else {
                                        return Center(
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {});
                                            },
                                            child: const text(
                                              title: 'التحقق من اتصال الانترنت',
                                              fontcolore: Colors.blue,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  )
                                ],
                              ))),
                        ),
                      ),
                      backgroundColor: grey,
                      isScrollControlled: true);
                }),
                child: text(
                  title: _park_name == null
                      ? 'اختيار الموقف'
                      : '${_park_name} تم اختيار الموقف ',
                  fontcolore: primcolor,
                  size: 20,
                  weight: FontWeight.bold,
                )),
            SizedBox(
              height: 30,
            ),
            text(
              title: _total == null ? '' : 'التكلفه: ${_total}ر.ي',
              fontcolore: primcolor,
              weight: FontWeight.bold,
              size: 20,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                if (_total == null) {
                  return empty_image('الرجاء اكمال البيانات اولا', Icons.error);
                }
                print(_new_price);
                print(_amount);
                if (_total > _amount) {
                  print('fff');
                  return empty_image('رصيدك غير كافي', Icons.error);
                }
                AwesomeDialog(
                  showCloseIcon: true,
                  dismissOnTouchOutside: false,
                  context: context,
                  dialogType: DialogType.success,
                  title: "ملخص عملية الحجز",
                  body: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    text(
                                      title: '${widget.buildname}',
                                      fontcolore: Colors.black,
                                      size: 20,
                                    ),
                                    size,
                                    text(
                                      title: '${_selectedpark}',
                                      fontcolore: Colors.black,
                                      size: 20,
                                    ),
                                    size,
                                    size,
                                    text(
                                      title:
                                          '${_currentDate.year}-${_currentDate.month}-${_currentDate.day}',
                                      fontcolore: Colors.black,
                                      size: 20,
                                    ),
                                    size,
                                    size,
                                    text(
                                      title: '${_hours} ساعات',
                                      fontcolore: Colors.black,
                                      size: 20,
                                    ),
                                    size,
                                    size,
                                    text(
                                      title: '${_from}:00 ',
                                      fontcolore: Colors.black,
                                      size: 20,
                                    ),
                                    size,
                                    size,
                                    text(
                                      title: '${_to}:00',
                                      fontcolore: Colors.black,
                                      size: 20,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    text(
                                      title: ':المبنى',
                                      fontcolore: Colors.grey,
                                      size: 20,
                                    ),
                                    size,
                                    text(
                                      title: ':رقم الموقف',
                                      fontcolore: Colors.grey,
                                      size: 20,
                                    ),
                                    size,
                                    text(
                                      title: ':تاريخ اليوم',
                                      fontcolore: Colors.grey,
                                      size: 20,
                                    ),
                                    size,
                                    text(
                                      title: ':المده ',
                                      fontcolore: Colors.grey,
                                      size: 20,
                                    ),
                                    size,
                                    text(
                                      title: ':من ',
                                      fontcolore: Colors.grey,
                                      size: 20,
                                    ),
                                    size,
                                    text(
                                      title: ':الى ',
                                      fontcolore: Colors.grey,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          height: 280,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(244, 244, 244, 1)),
                        ),
                      ),
                      size,
                      size,
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          text(
                                            title: '${_total}ر.ي',
                                            fontcolore: Colors.black,
                                            size: 20,
                                          ),
                                          size,
                                          text(
                                            title: '${_amount}ر.ي',
                                            fontcolore: Colors.black,
                                            size: 20,
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          text(
                                            title: ':التكلفه ',
                                            fontcolore: Colors.grey,
                                            size: 20,
                                          ),
                                          size,
                                          text(
                                            title: ':الرصيد قبل الحجز ',
                                            fontcolore: Colors.grey,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ]),
                                size,
                                size,
                                Divider(
                                  height: 20,
                                  endIndent: 30,
                                  indent: 30,
                                  color: Color.fromRGBO(161, 161, 161, 1),
                                ),
                                size,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    text(
                                      title: '${_new_price}ر.ي',
                                      fontcolore: Colors.black,
                                      size: 20,
                                    ),
                                    text(
                                      title: ':الرصيد الحالي ',
                                      fontcolore: Colors.grey,
                                      size: 20,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          height: 200,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(244, 244, 244, 1),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ],
                  ),
                  btnOkText: loading == true ? '..يتم التحميل' : 'تأكــيد',
                  buttonsTextStyle: TextStyle(fontSize: 20),
                  btnOkColor: primcolor,
                  btnOkOnPress: () {
                     do_booking();
                  },
                ).show();
              },
              child: text(
                title: 'حجز',
                size: 20,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primcolor),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 100, vertical: 10)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
