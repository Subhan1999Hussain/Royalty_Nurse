import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/custom_widget_folder/custom._container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_fancy_image.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

class FindScreenContainer extends StatelessWidget {
  final String jobTitle, hospitalName, image;
  final double location;
  void Function()? onTap;

  FindScreenContainer({
    Key? key,
    required this.jobTitle,
    required this.image,
    required this.hospitalName,
    required this.location,
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
              //----------------Job Title Text----------------
              jobTitleWidget(),
              const SizedBox(height: 8.0),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                //----------------Hospital Name----------------
                hospitalNameWidget(),
                SizedBox(width: 10.w),
                //----------------Distance in Km----------------
                distanceKmWidget(),
              ]),
            ]),
          ),
          const SizedBox(width: 5.0),
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
    return CustomText(
        maintext: jobTitle, fontsize: 18.sp, color: AppColors.PURPLE_COLOR);
  }

  Widget hospitalNameWidget() {
    return Expanded(
      child: CustomText(
          maintext: hospitalName, fontsize: 15.sp, color: AppColors.GREY_COLOR),
    );
  }

  Widget distanceKmWidget() {
    return CustomText(
        maintext: "${location.toStringAsFixed(2)}Km", fontsize: 15.sp);
  }
}
