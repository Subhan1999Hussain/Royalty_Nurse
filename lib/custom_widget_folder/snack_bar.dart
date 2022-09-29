import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/utils/app_color.dart';

class SnackBar_Message {
  SnackBar_Message(String msg) {
    Get.rawSnackbar(
      maxWidth: .9.sw,
      borderRadius: 10,
      snackPosition: SnackPosition.TOP,
      backgroundGradient: const LinearGradient(colors: [
        AppColors.BUTTON_GRADIENT1_COLOR,
        AppColors.BUTTON_GRADIENT2_COLOR,
        AppColors.BUTTON_GRADIENT3_COLOR,
        AppColors.BUTTON_GRADIENT4_COLOR
      ]),
      backgroundColor: AppColors.BLACK_COLOR,
      duration: const Duration(seconds: 2),
      messageText: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: CustomText(maintext: 
          msg,
          fontsize: 20.sp, color: AppColors.BLACK_COLOR,is_alignLeft: false,
        ),
      ),
    );
  }
}
