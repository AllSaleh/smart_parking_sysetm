import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_parking_project1/cons/color.dart';
import 'package:smart_parking_project1/main.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import 'package:smart_parking_project1/views/userpages/authpages/login_page.dart';
import 'package:smart_parking_project1/views/userpages/notification.dart';

import 'package:smart_parking_project1/widgts/text.dart';

import '../../model/CRUD.dart';
import '../../widgts/ListTile2.dart';
import 'edit_account.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> with Crud {
  display_account() async {
    var response = await getRequest(
        '${Applinks.displayaccount_link}?id=${sharedPref.getString('user_id')}');
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Align(
              alignment: Alignment.centerRight,
              child: text(
                title: 'الملف الشخصي',
                size: 25,
                weight: FontWeight.bold,
                fontcolore: Colors.black,
              ),
            )),
        body: SafeArea(
          child: FutureBuilder(
              future: display_account(),
              builder: ((BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            '${Applinks.usersImaesLink}/${snapshot.data['data']['user_pic']}'),
                        radius: 50,
                      ),
                      text(
                        title: '${snapshot.data['data']['user_name']}',
                        weight: FontWeight.bold,
                        size: 25,
                      ),
                      text(
                        title: '${snapshot.data['data']['user_email']}',
                        size: 18,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListTile2(
                          ontap: () {
                            Get.to(edite_profile(
                              username: snapshot.data['data']['username'],
                              password: snapshot.data['data']['password'],
                              name: snapshot.data['data']['user_name'],
                              email: snapshot.data['data']['user_email'],
                              phone: snapshot.data['data']['user_phone']
                                  .toString(),
                              adress: snapshot.data['data']['user_location'],
                            
                              iamge: snapshot.data['data']['user_pic'],
                              id: snapshot.data['data']['user_id'],
                            ));
                          },
                          title: 'تعديل الملف الشخصي',
                          trilingicons: Icons.person),
                      ListTile2(
                        title: 'الرصيد',
                        trilingicons: Icons.payment,
                        ontap: () {
                          Get.defaultDialog(
                              middleTextStyle: TextStyle(fontSize: 20),
                              title: 'عرض الرصيد',
                              titleStyle:
                                  TextStyle(color: primcolor, fontSize: 20),
                              middleText:
                                  'رصيدك الحالي: ${snapshot.data['data']['amount']} ر.ي');
                        },
                      ),
                      ListTile2(
                        title: 'الاشعارات',
                        trilingicons: Icons.notifications_none,
                        ontap: () {
                          Get.to(notifcation());
                        },
                      ),
                      ListTile2(
                          title: 'الحمايه', trilingicons: Icons.privacy_tip),
                      ListTile2(
                          title: 'الوضع المظلم', trilingicons: Icons.dark_mode),
                      ListTile2(
                        title: 'تسجيل الخروج',
                        trilingicons: Icons.logout,
                        ontap: () {
                          Get.offAll(Loginpage());
                          sharedPref.clear();
                        },
                      )
                    ],
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
              })),
        ));
  }
}
