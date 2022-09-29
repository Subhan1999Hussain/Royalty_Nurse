import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/custom_widget_folder/custom._container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_fancy_image.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/shift_module/Screens/confirm_clock_in_out_alert_box.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

class shiftClockContainer extends StatelessWidget {
  final String jobTitle, hospitalName, image, rate, time, hospitalId;
  void Function()? onTap;
  shiftClockContainer(
      {Key? key,
      required this.jobTitle,
      required this.image,
      required this.hospitalName,
      required this.rate,
      required this.time,
      required this.hospitalId,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        radius: 10,
        child: Column(children: [
          Row(children: [
            //----------------Image Container----------------
            imageContainerWidget(),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //----------------Job Title Text----------------
                    jobTitleWidget(),
                    const SizedBox(height: 8.0),
                    //----------------Hospital Name Text----------------
                    hospitalNameWidget(),
                    const SizedBox(height: 8.0),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //----------------Time Text----------------
                          timeWidget(),
                          SizedBox(width: 10.w),
                          //----------------Rate Text----------------
                          rateWidget(),
                        ]),
                  ]),
            ),
            const SizedBox(width: 5.0),
          ]),
          SizedBox(height: 8.h),
          //----------------Clock In Out Button----------------
          clockInOutButtonWidget(context),
        ]),
      ),
    );
  }

  Widget imageContainerWidget() {
    return SizedBox(
      width: 70.w, height: 80.h,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //       image: NetworkImage(NetworkStrings.baseUrl + image),
      //       fit: BoxFit.contain),
      // ),
      child: CustomFancyImage(image: NetworkStrings.baseUrl + image),
    );
  }

  Widget jobTitleWidget() {
    return CustomText(
        maintext: jobTitle, fontsize: 18.sp, color: AppColors.PURPLE_COLOR);
  }

  Widget hospitalNameWidget() {
    return CustomText(
        maintext: hospitalName, fontsize: 15.sp, color: AppColors.GREY_COLOR);
  }

  Widget timeWidget() {
    return Expanded(
      child: CustomText(
          maintext: time, fontsize: 15.sp, color: AppColors.GREY_COLOR),
    );
  }

  Widget rateWidget() {
    return CustomText(maintext: "\$$rate/hour", fontsize: 15.sp);
  }

  Widget clockInOutButtonWidget(BuildContext context) {
    return Row(children: [
      //----------------Clock In Button----------------
      clockInButtonWidget(context),
      SizedBox(width: 0.02.sw),
      //----------------Clock Out Button----------------
      clockOutButtonWidget(context),
      SizedBox(height: 8.h),
    ]);
  }

  Widget clockInButtonWidget(BuildContext context) {
    return Expanded(
      child: CustomButton(
          is_gradient: false,
          text: AppStrings.CLOCK_IN_CLOCK_TEXT,
          height: 0.06.sh,
          color: AppColors.LIGHT_BUTTON_COLOR,
          onclick: () {
            showDialog(
                context: context,
                builder: (context) => confirmClockInOutAlertBox(
                    attendanceType: AppStrings.CLOCK_IN_BUTTON_TEXT,
                    hospitalId: hospitalId,
                    checkIn: true));
          }),
    );
  }

  Widget clockOutButtonWidget(BuildContext context) {
    return Expanded(
      child: CustomButton(
          text: AppStrings.CLOCK_OUT_CLOCK_TEXT,
          height: 0.06.sh,
          onclick: () {
            showDialog(
                context: context,
                builder: (context) => confirmClockInOutAlertBox(
                    attendanceType: AppStrings.CLOCK_OUT_BUTTON_TEXT,
                    hospitalId: hospitalId,
                    checkIn: false));
          }),
    );
  }
}
