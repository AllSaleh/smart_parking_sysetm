import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/model/CRUD.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import 'package:smart_parking_project1/views/users_pages/display_parking.dart';
import 'package:smart_parking_project1/widgts/text.dart';

class search_booking extends StatefulWidget {
  search_booking({super.key});

  @override
  State<search_booking> createState() => _search_bookingState();
}

class _search_bookingState extends State<search_booking> with Crud {
  display() async {
    var response = await getRequest(Applinks.display_bilds);
    return response;
  }

  @override
  void initState() {
    super.initState();
    display();
  }

  var _selecteditem;
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.black,
                grey,
              ])),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: text(
                    title: 'اختر المبنى',
                    size: 25,
                    fontcolore: Colors.white,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
              FutureBuilder(
                future: display(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data['s'] == 'f') {
                      return const Center(
                        child: text(
                          title: 'لايوجد مباني',
                          size: 20,
                          weight: FontWeight.bold,
                        ),
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Center(
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: snapshot.data['data'].length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(top: 20, left: 20),
                              child: InkWell(
                                onTap: () {
                                  Get.to(display_parking(
                                    id: snapshot.data['data'][index]
                                        ['bulding_id'],
                                    buildname: snapshot.data['data'][index]
                                        ['bulding_name'],
                                  ));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: grey,
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 100,
                                  width: 50,
                                  child: Center(
                                      child: text(
                                    title:
                                        '${snapshot.data['data'][index]['bulding_name']}',
                                    size: 20,
                                  )),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Lottie.asset('lotties/loading.json'),
                    );
                  } else {
                    return Center(
                      child: text(title: 'No conect with internet'),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
