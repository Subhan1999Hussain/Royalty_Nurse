import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/custom_widget_folder/custom._container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_fancy_image.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/timesheet_module/Model/timesheet_model.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

class timeLine extends StatelessWidget {
  final String jobTitle, hospitalName, image, rate, time, type;
  List<Clock>? clock;
  timeLine(
      {Key? key,
      required this.jobTitle,
      required this.hospitalName,
      required this.image,
      required this.rate,
      required this.time,
      required this.clock,
      required this.type})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomContainer(
        radius: 10,
        child: Row(children: [
          //----------------Image Container----------------
          imageContainerWidget(),
          SizedBox(width: 10.w),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //----------------Job Title Text----------------
              jobTitleWidget(),
              const SizedBox(height: 8.0),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                //----------------Hospital Name Text----------------
                hospitalNameWidget(),
                SizedBox(width: 10.w),
                //----------------Hourly Rate Test----------------
                rateWidget(),
              ]),
            ]),
          ),
        ]),
      ),
      const SizedBox(height: 25.0),
      Row(children: [
        SizedBox(width: 50.w),
        //----------------Timing Text----------------
        timingTextWidget(),
        SizedBox(width: 110.w),
        //----------------Check Type Text----------------
        checkTypeWidget(),
        const SizedBox(),
      ]),
      //----------------Time And Type List----------------
      timeandTypeListWidget(),
    ]);
  }

  Widget imageContainerWidget() {
    return SizedBox(
      width: 70.w,
      height: 80.h,
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
        maintext: jobTitle, fontsize: 22.sp, color: AppColors.PURPLE_COLOR);
  }

  Widget hospitalNameWidget() {
    return Expanded(
      child: CustomText(
          maintext: hospitalName, fontsize: 15.sp, color: AppColors.GREY_COLOR),
    );
  }

  Widget rateWidget() {
    return CustomText(maintext: "\$$rate/hour", fontsize: 15.sp);
  }

  Widget timingTextWidget() {
    return CustomText(
        maintext: AppStrings.TIMING_TEXT,
        fontsize: 23.sp,
        color: AppColors.PURPLE_COLOR,
        is_alignLeft: false);
  }

  Widget checkTypeWidget() {
    return CustomText(
        maintext: AppStrings.TYPE_TEXT,
        fontsize: 23.sp,
        color: AppColors.PURPLE_COLOR,
        is_alignLeft: false);
  }

  Widget timeandTypeListWidget() {
    return Table(
      children: List.generate(
        clock!.length,
        ((index) => TableRow(children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0.h),
                child: CustomText(
                    maintext: clock![index].clockTime,
                    fontsize: 15.sp,
                    is_alignLeft: false),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0.h),
                child: CustomText(
                    maintext: clock![index].clockType,
                    fontsize: 15.sp,
                    is_alignLeft: false),
              ),
            ])),
      ),
    );
  }
}
