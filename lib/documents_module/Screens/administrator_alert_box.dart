import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';

class AdministratorAlertBox extends StatelessWidget {
  const AdministratorAlertBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        //----------------Administrator Main Text----------------
        SizedBox(height: 20.h),
        administratorTextWidget(),
        //----------------Will Call To Setup Text----------------
        SizedBox(height: 20.h),
        willCallToSetupWidget(),
        //--------------------Alright Button Text-------------------
        SizedBox(height: 35.h),
        alrightButtonWidget(),
      ]),
    );
  }

  Widget administratorTextWidget() {
    return CustomText(
        maintext: AppStrings.ADMINISTRATOR_TEXT,
        color: AppColors.PURPLE_COLOR,
        is_alignLeft: false,
        fontsize: 27.sp,
        fontWeight: FontWeight.w800);
  }

  Widget willCallToSetupWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0.w),
      child: CustomText(
          maintext: AppStrings
              .WILL_CALL_TO_SETUP_AN_APPOINTMENT_FOR_DRUG_SCREENING_TEXT,
          fontsize: 17.sp,
          is_alignLeft: false),
    );
  }

  Widget alrightButtonWidget() {
    return GestureDetector(
      onTap: () {
        Get.offAllNamed(Paths.BOTTOM_NAVIGATION_SCREEN_ROUTE);
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
          gradient: LinearGradient(colors: [
            AppColors.BUTTON_GRADIENT1_COLOR,
            AppColors.BUTTON_GRADIENT2_COLOR,
            AppColors.BUTTON_GRADIENT3_COLOR,
            AppColors.BUTTON_GRADIENT4_COLOR,
          ]),
        ),
        height: 45.h,
        child: Padding(
          padding: EdgeInsets.only(left: 8.w, top: 8.h, bottom: 8.h),
          child: CustomText(
              maintext: AppStrings.ALRIGHT_BUTTON_TEXT, is_alignLeft: false),
        ),
      ),
    );
  }
}
