import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/custom_widget_folder/custom._container.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class RatingContainer extends StatelessWidget {
  final String firstText;

  const RatingContainer({
    Key? key,
    required this.firstText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      radius: 10,
      child: Column(children: [
        Row(children: [
          //----------------Image Container----------------
          imageContainerWidget(),
          //----------------Main Column----------------
          SizedBox(width: 10.w),
          mainColumnWidget(),
        ]),
        SizedBox(height: 5.h),
        CustomText(maintext: AppStrings.RATING_TEXT),
      ]),
    );
  }

  Widget imageContainerWidget() {
    return Container(
        width: 0.25.sw,
        height: 0.12.sh,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 183, 171),
            borderRadius: BorderRadius.circular(10.0)),
        child: Image.asset(AssetPaths.HEX_LAB_IMAGE, scale: 3.w));
  }

  Widget mainColumnWidget() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //----------------Job Title Text----------------
          jobTitleWidget(),
          //----------------Hospital Name Text----------------
          hospitalNameWidget(),
          //----------------Rating Area Text----------------
          ratingAreaWidget(),
        ]);
  }

  Widget jobTitleWidget() {
    return CustomText(
        maintext: firstText, fontsize: 26.sp, color: AppColors.PURPLE_COLOR);
  }

  Widget hospitalNameWidget() {
    return CustomText(
        maintext: AppStrings.SKILLED_NURSING_CENTER_LIST_TEXT, fontsize: 18.sp);
  }

  Widget ratingAreaWidget() {
    return Row(children: [
      Icon(Icons.star_rate_rounded, color: Colors.amber, size: 32.w),
      CustomText(maintext: AppStrings.RATING_NUMBER_TEXT),
    ]);
  }
}
