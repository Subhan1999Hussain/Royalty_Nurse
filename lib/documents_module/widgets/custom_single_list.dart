import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/custom_widget_folder/custom._container.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class CustomSingleList extends StatelessWidget {
  final String firstText;
  final int status;
  Widget? image;

  final Function()? onclick;
  CustomSingleList({
    Key? key,
    required this.firstText,
    required this.status,
    required this.image,
    this.onclick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 0.1.sh,
      radius: 10.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //----------------Leading Text----------------
                leadingTextWidget(),
                //---------Process Text Missing, Pending, Verified-------------
                processTextWidget(),
              ]),
          //-----------------------Upload Image Icon------------------------
          uploadImageIconWidget(),
        ]),
      ),
    );
  }

  Widget leadingTextWidget() {
    return CustomText(
        maintext: firstText, color: AppColors.PURPLE_COLOR, fontsize: 22.sp);
  }

  Widget processTextWidget() {
    return CustomText(
        maintext: status == 0
            ? AppStrings.MISSING_PROCESS_TEXT
            : status == 1
                ? AppStrings.PENDING_PROCESS_TEXT
                : AppStrings.VERIFIED_PROCESS_TEXT,
        color: status == 0
            ? AppColors.ORANGE_COLOR
            : status == 1
                ? AppColors.RED_COLOR
                : AppColors.GREEN_COLOR,
        fontsize: 13.sp);
  }

  Widget uploadImageIconWidget() {
    return GestureDetector(onTap: onclick, child: image);
  }
}
