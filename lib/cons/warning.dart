import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_parking_project1/cons/color.dart';

waring_deleting(BuildContext context, Function()? okbutton) {
  AwesomeDialog(
          context: context,
          showCloseIcon: true,
          dismissOnTouchOutside: false,
          dialogType: DialogType.warning,
          btnOkText: 'حذف',
          descTextStyle: const TextStyle(
            fontSize: 20,
          ),
          buttonsTextStyle: const TextStyle(fontSize: 25),
          btnOkOnPress: okbutton,
          btnOkColor: primcolor,
          desc: 'هل تود الحذف؟')
      .show();
}
