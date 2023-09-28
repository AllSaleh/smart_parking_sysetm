import 'package:get/get.dart';

validate(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return 'لايمكن ترك الحقل فارفا';
  }

  if (val.length < min) {
    return 'الحقل ناقص ';
  }
  if (val.length > max) {
    return 'الحقل كبير جدا';
  }
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return 'الحقل يجب يكون اسم المستخدم';
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return 'الحقل يجب يكون بريد الكتروني ';
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'الحقل يجب يكون رقم جوال ';
    }
  }
}
