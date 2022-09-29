import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text_field.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_strings.dart';

class ReciveWithPayPal extends StatelessWidget {
  const ReciveWithPayPal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: 0.05.sh),
        //----------------Email Address Field----------------
        CustomTextField(hint: AppStrings.EMAIL_FIELD_TEXT),
        SizedBox(height: 0.02.sh),
        //----------------Password Field----------------
        CustomTextField(
            hint: AppStrings.PASSWORD_FIELD_TEXT, obscureText: true),
        SizedBox(height: 0.3.sh),
        //----------------Login with PayPal Button----------------
        CustomButton(
          text: AppStrings.LOGIN_WITH_PAYPAL_BUTTON_TEXT,
          onclick: () {
            Get.offAllNamed(Paths.BOTTOM_NAVIGATION_SCREEN_ROUTE);
          },
        ),
      ]),
    );
  }
}
