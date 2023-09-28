import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_parking_project1/cons/choose_iamge.dart';
import 'package:smart_parking_project1/cons/validat_fun.dart';
import 'package:smart_parking_project1/main.dart';
import 'package:smart_parking_project1/model/CRUD.dart';
import 'package:smart_parking_project1/model/linkes.dart';
import '../../../cons/color.dart';
import '../../../widgts/text.dart';
import '../../../widgts/textformfild.dart';

class edite_profile extends StatefulWidget {
  final String iamge;
  final String username;
  final String password;
  final String name;
  final String email;
  final String phone;
  final String adress;
  
  final int id;

  const edite_profile(
      {super.key,
      required this.username,
      required this.password,
      required this.name,
      required this.email,
      required this.phone,
      required this.adress,
      
      required this.id,
      required this.iamge});

  @override
  State<edite_profile> createState() => _edite_profileState();
}

class _edite_profileState extends State<edite_profile> with Crud {
  @override
  void initState() {
    username.text = widget.username;
    password.text = widget.password;
    name.text = widget.name;
    email.text = widget.email;
    phone.text = widget.phone;
    address.text = widget.adress;

    super.initState();
  }

  File? _image;
  var _key = GlobalKey<FormState>();
  var name = TextEditingController();
  var username = TextEditingController();
  var password = TextEditingController();

  var email = TextEditingController();
  var phone = TextEditingController();
  var gender = TextEditingController();
  var address = TextEditingController();

  final imagepicker = ImagePicker();
  uploadcamera() async {
    final XFile? picked =
        await imagepicker.pickImage(source: ImageSource.camera);

    if (picked == null) {
      Get.back();
      return;
    }
    setState(() {
      _image = File(picked.path);
      Get.back();
    });
  }

  uploadgallry() async {
    final XFile? picked =
        await imagepicker.pickImage(source: ImageSource.gallery);

    if (picked == null) {
      Get.back();
      return;
    }
    setState(() {
      _image = File(picked.path);
      Get.back();
    });
  }

  edite_profile() async {
    if (_key.currentState!.validate()) {
      // if (_image == null) return empty_image('لايمكن ترك صورة الملف الشخصي فارغه',Icons.person);
      // if (_gender == null) return empty_gender();
      var rsponse = await postRequst(
        Applinks.edit_account,
        {
          'name': name.text,
          'email': email.text,
          'phone': phone.text,
          'address': address.text,
          'username': widget.username,
          'password': widget.password,
          'id': sharedPref.getString('user_id').toString()
        },
      );
      print(rsponse);
      // if (rsponse['s'] == 's') {
      //   Get.off(profile());
      // } else {
      //   exsist();
      // }
    }
  }

  bool _obsu = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerRight,
          child: text(
            title: 'تعديل الملف الشخصي',
            size: 25,
            fontcolore: Colors.black,
            weight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon:const Icon(
              Icons.arrow_back,
              color: primcolor,
              size: 25,
            )),
      ),
      body: SafeArea(
          child: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  choose_image(uploadcamera, uploadgallry);
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      '${Applinks.usersImaesLink}/${widget.iamge}'),
                  backgroundColor: grey,
                  radius: 60,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Textformfiled(
                controller: username,
                validat: (val) {
                  return validate(val!, 8, 20, 'username');
                },
                obsc: false,
                lable_text: 'اسـم المستخدم',
                suffixicone: Icons.person,
              ),
              const SizedBox(
                height: 15,
              ),
              Textformfiled(
                controller: password,
                validat: (val) {
                  return validate(val!, 9, 15, 'password');
                },
                obsc: _obsu,
                lable_text: 'كلمة المرور',
                suffixicone: Icons.password,
                prefxicon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obsu = !_obsu;
                    });
                  },
                  child: Icon(_obsu ? Icons.visibility : Icons.visibility_off,
                      color: Color.fromRGBO(169, 169, 169, 1)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Textformfiled(
                controller: name,
                validat: (val) {
                  return validate(val!, 5, 12, 'name');
                },
                textinput: TextInputType.name,
                obsc: false,
                lable_text: 'الاسم',
                suffixicone: Icons.person,
              ),
              const SizedBox(
                height: 10,
              ),
              Textformfiled(
                  controller: email,
                  validat: (val) {
                    return validate(val!, 10, 20, 'email');
                  },
                  textinput: TextInputType.emailAddress,
                  lable_text: 'البريد الالكتروني',
                  suffixicone: Icons.email,
                  obsc: false),
              const SizedBox(
                height: 10,
              ),
              Textformfiled(
                  validat: (val) {
                    return validate(val!, 9, 12, 'phone');
                  },
                  controller: phone,
                  textinput: TextInputType.phone,
                  lable_text: 'رقم الجوال',
                  suffixicone: Icons.phone_android,
                  obsc: false),
              const SizedBox(
                height: 10,
              ),
              Textformfiled(
                  validat: (val) {
                    return validate(val!, 5, 12, 'address');
                  },
                  controller: address,
                  lable_text: "العنوان",
                  suffixicone: Icons.location_city,
                  obsc: false),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              ElevatedButton(
                onPressed: () {
                  edite_profile();
                },
                child:const text(
                  title: 'تعديل',
                  size: 20,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primcolor),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      horizontal: 100, vertical: 10)),
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
      )),
    );
  }
}
