import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/model/CRUD.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import '../../widgts/text.dart';

class add_amount extends StatefulWidget {
  const add_amount({super.key});

  @override
  State<add_amount> createState() => _add_amountState();
}

class _add_amountState extends State<add_amount> with Crud {
  display_ordres() async {
    var response = await getRequest(Applinks.display_ordrs);
    return response;
  }

  add_amounts(blance, id, id_order) async {
    var response = await postRequst(Applinks.add_blance,
        {'blance': blance, 'id': id, 'id_order': id_order});
    if (response['s'] == 's') {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: text(
              title: 'اضافة رصيد ',
              fontcolore: Colors.black,
              weight: FontWeight.bold,
              size: 25,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: FutureBuilder(
          future: display_ordres(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data['s'] == 'f') {
                return const Center(
                  child: text(
                    title: 'لايوجد طلبات',
                    size: 25,
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data['data'].length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: Card(
                      elevation: 20,
                      shadowColor: primcolor,
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      text(
                                        title:
                                            '${snapshot.data['data'][index]['user_name']} ',
                                        fontcolore: Colors.black,
                                        size: 20,
                                      ),
                                      text(
                                        title:
                                            '${snapshot.data['data'][index]['price']} ',
                                        fontcolore: Colors.black,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.defaultDialog(
                                              title: 'سند ايداع الرصيد',
                                              content: Container(
                                                child: InteractiveViewer(
                                                    scaleEnabled: true,
                                                    minScale: 0.3,
                                                    maxScale: 3,
                                                    child: Image.network(
                                                      '${Applinks.disponseImaesLink}/${snapshot.data['data'][index]['disponse_image']}',
                                                      fit: BoxFit.fill,
                                                    )),
                                                height: 150,
                                              ));
                                        },
                                        child: Container(
                                          width: 100,
                                          height: 50,
                                          child: Image.network(
                                            '${Applinks.disponseImaesLink}/${snapshot.data['data'][index]['disponse_image']}',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      text(
                                        title: ':اسم العميل',
                                        fontcolore: Colors.grey,
                                        size: 20,
                                      ),
                                      text(
                                        title: ':الرصيد المراد اضافته',
                                        fontcolore: Colors.grey,
                                        size: 20,
                                      ),
                                      text(
                                        title: ':سند الايداع  ',
                                        fontcolore: Colors.grey,
                                        size: 20,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: (() {
                                        add_amounts(
                                            (snapshot.data['data'][index]
                                                        ['price'] +
                                                    snapshot.data['data'][index]
                                                        ['amount'])
                                                .toString(),
                                            snapshot.data['data'][index]
                                                    ['user_id']
                                                .toString(),
                                            snapshot.data['data'][index]
                                                    ['order_id']
                                                .toString());

                                        AwesomeDialog(
                                                btnCancelText: "حسنا",
                                                btnCancelOnPress: () async {
                                                  var response =
                                                      await postRequst(
                                                          Applinks.accept_order,
                                                          {
                                                        'price': snapshot
                                                            .data['data'][index]
                                                                ['price']
                                                            .toString(),
                                                        'new_price': (snapshot.data[
                                                                            'data']
                                                                        [index]
                                                                    ['price'] +
                                                                snapshot.data[
                                                                            'data']
                                                                        [index]
                                                                    ['amount'])
                                                            .toString(),
                                                        'status': 0.toString(),
                                                        'id_user': snapshot
                                                            .data['data'][index]
                                                                ['user_id']
                                                            .toString()
                                                      });

                                                  print(response);
                                                  setState(() {});
                                                },
                                                // showCloseIcon: true,
                                                dismissOnTouchOutside: false,
                                                dialogBackgroundColor:
                                                    primcolor,
                                                context: context,
                                                dialogType: DialogType.success,
                                                desc: 'تم قبول الطلب ',
                                                btnOkText: 'حسنا',
                                                descTextStyle: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))
                                            .show();
                                      }),
                                      icon: Icon(
                                        Icons.done,
                                        color: Colors.green,
                                        size: 45,
                                      )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  IconButton(
                                      onPressed: (() async {
                                        AwesomeDialog(
                                                btnCancelText: 'موافق',
                                                btnCancelOnPress: () async {
                                                  var response =
                                                      await postRequst(
                                                          Applinks.reject_order,
                                                          {
                                                        'price': snapshot
                                                            .data['data'][index]
                                                                ['price']
                                                            .toString(),
                                                        'status': 0.toString(),
                                                        'id_user': snapshot
                                                            .data['data'][index]
                                                                ['user_id']
                                                            .toString(),
                                                        'image': snapshot.data[
                                                                'data'][index]
                                                            ['disponse_image'],
                                                        'id_order': snapshot
                                                            .data['data'][index]
                                                                ['order_id']
                                                            .toString(),
                                                        'new_price': snapshot
                                                            .data['data'][index]
                                                                ['price']
                                                            .toString()
                                                      });
                                                  print(response);
                                                },
                                                showCloseIcon: true,
                                                dismissOnTouchOutside: false,
                                                dialogBackgroundColor:
                                                    primcolor,
                                                context: context,
                                                dialogType: DialogType.error,
                                                desc: 'تم رفض الطلب ',
                                                btnOkText: 'حسنا',
                                                descTextStyle: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))
                                            .show();
                                      }),
                                      icon: Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                        size: 45,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                        height: 210,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  );
                },
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.asset('lotties/loading.json'),
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
        ));
  }
}
