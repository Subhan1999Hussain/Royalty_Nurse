import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/custom_widget_folder/custom._container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_fancy_image.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

class MyShiftContainer extends StatelessWidget {
  final String jobTitle, hospitalName, image, date, rate;
  void Function()? onTap;

  MyShiftContainer({
    Key? key,
    required this.jobTitle,
    required this.image,
    required this.hospitalName,
    required this.rate,
    required this.date,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        radius: 10,
        child: Row(children: [
          //----------------Image Container----------------
          imageContainerWidget(),
          SizedBox(width: 10.w),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                //----------------Job Title Text----------------
                jobTitleWidget(),
                SizedBox(width: 10.w),
                //----------------Hourly Rate Text----------------
                rateWidget(),
              ]),
              SizedBox(height: 5.h),
              //----------------Hospital Name Text----------------
              hospitalNameWidget(),
              SizedBox(height: 5.h),
              //----------------Date Text----------------
              dateWidget(),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget imageContainerWidget() {
    return SizedBox(
      width: 70.w,
      height: 80.h,
      child: CustomFancyImage(image: NetworkStrings.baseUrl + image),
    );
  }

  Widget jobTitleWidget() {
    return Expanded(
      child: CustomText(
          maintext: jobTitle, fontsize: 18.sp, color: AppColors.PURPLE_COLOR),
    );
  }

  Widget rateWidget() {
    return CustomText(maintext: "\$$rate/hour", fontsize: 15.sp);
  }

  Widget hospitalNameWidget() {
    return CustomText(
        maintext: hospitalName, fontsize: 15.sp, color: AppColors.GREY_COLOR);
  }

  Widget dateWidget() {
    return CustomText(
        maintext: date, fontsize: 15.sp, color: AppColors.GREY_COLOR);
  }
}
