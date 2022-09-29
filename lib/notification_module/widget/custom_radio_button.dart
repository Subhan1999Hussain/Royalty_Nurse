import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/utils/app_color.dart';

class CustomRadioButton extends StatelessWidget {
  final String notificationText;
  Function(Object?)? onchanged;
  var val;

  CustomRadioButton(
      {Key? key, required this.notificationText, this.onchanged, this.val})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      //----------------Radio Button----------------
      radioButtonWidget(),
      //----------------Notification Text----------------
      notificationWidget(),
    ]);
  }

  Widget radioButtonWidget() {
    return Transform.scale(
      scale: 1.w,
      child: Radio(
          value: 0,
          groupValue: val,
          onChanged: onchanged,
          activeColor: AppColors.PURPLE_COLOR,
          toggleable: true),
    );
  }

  Widget notificationWidget() {
    return CustomText(maintext: notificationText, fontsize: 17.sp);
  }
}
