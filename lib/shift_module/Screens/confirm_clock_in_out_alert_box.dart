import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/shift_module/Controller/clock_controller.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';

class confirmClockInOutAlertBox extends StatelessWidget {
  String attendanceType, hospitalId;
  bool checkIn;

  confirmClockInOutAlertBox(
      {Key? key,
      required this.attendanceType,
      required this.hospitalId,
      required this.checkIn})
      : super(key: key);

  ClockController inOutController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //----------------Confirm Clock In Text----------------
          SizedBox(height: 20.h),
          confirmClockInWidget(),
          //----------------Please Select Time Text----------------
          pleaseSelectTimeWidget(),
          //----------------Time Clock Text----------------
          SizedBox(height: 20.h),
          timeClockWidget(),
          //----------------Two Button Row Text----------------
          SizedBox(height: 35.h),
          buttonRowWidget(),
        ],
      ),
    );
  }

  Widget confirmClockInWidget() {
    return CustomText(
        maintext: checkIn == true
            ? AppStrings.CONFIRM_CLOCK_IN_TEXT
            : AppStrings.CONFIRM_CLOCK_OUT_TEXT,
        color: AppColors.PURPLE_COLOR,
        is_alignLeft: false,
        fontsize: 25.sp,
        fontWeight: FontWeight.w800);
  }

  Widget pleaseSelectTimeWidget() {
    return CustomText(
        maintext: checkIn == true
            ? AppStrings.THE_TIME_OF_YOUR_CHECK_IN_TEXT
            : AppStrings.THE_TIME_OF_YOUR_CHECK_OUT_TEXT,
        fontsize: 12.sp,
        is_alignLeft: false);
  }

  Widget timeClockWidget() {
    return SizedBox(
      height: 200,
      child: AbsorbPointer(
        absorbing: true,
        child: CupertinoDatePicker(
            initialDateTime: inOutController.dateTime,
            mode: CupertinoDatePickerMode.time,
            onDateTimeChanged: (d) {}),
      ),
    );
  }

  Widget buttonRowWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      //----------------Later Button----------------
      laterButtonWidget(),
      //----------------Clock In or Out Button----------------
      clockInOutButtonWidget(),
    ]);
  }

  Widget laterButtonWidget() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
              color: AppColors.SEMI_GREY_COLOR),
          height: 45.h,
          child: Padding(
            padding: EdgeInsets.only(left: 12.w, top: 12.h, bottom: 12.h),
            child: CustomText(
                maintext: AppStrings.LATER_BUTTON_TEXT, is_alignLeft: false),
          ),
        ),
      ),
    );
  }

  Widget clockInOutButtonWidget() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          inOutController.inOut(hospitalId, checkIn);
          // Get.back();
        },
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
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
            child: CustomText(maintext: attendanceType, is_alignLeft: false),
          ),
        ),
      ),
    );
  }
}
