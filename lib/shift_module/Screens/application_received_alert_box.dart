import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';

class ApplicationReceivedAlertBox extends StatelessWidget {
  const ApplicationReceivedAlertBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        //----------------Application Received Main Text----------------
        SizedBox(height: 20.h),
        applicationReceivedTextWidget(),
        //----------------Your Application Is Requested For Aproval Text----------------
        SizedBox(height: 20.h),
        yourApplicationIsRequestedWidget(),
        //----------------Go Back Button----------------
        SizedBox(height: 35.h),
        goBackButtonWidget(),
      ]),
    );
  }

  Widget applicationReceivedTextWidget() {
    return CustomText(
        maintext: AppStrings.APPLICATION_RECEIVED_TEXT,
        color: AppColors.PURPLE_COLOR,
        is_alignLeft: false,
        fontsize: 25.sp,
        fontWeight: FontWeight.w800);
  }

  Widget yourApplicationIsRequestedWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0.w),
      child: CustomText(
          maintext: AppStrings.YOUR_APPLICATION_IS_REQUESTED_FOR_APPROVAL_TEXT,
          fontsize: 16.sp,
          is_alignLeft: false),
    );
  }

  Widget goBackButtonWidget() {
    return GestureDetector(
      onTap: () {
        Get.offNamed(Paths.BOTTOM_NAVIGATION_SCREEN_ROUTE);
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
            ])),
        height: 45.h,
        child: Padding(
          padding: EdgeInsets.only(left: 8.w, top: 8.h, bottom: 8.h),
          child: CustomText(
              maintext: AppStrings.GO_BACK_BUTTON_TEXT, is_alignLeft: false),
        ),
      ),
    );
  }
}
