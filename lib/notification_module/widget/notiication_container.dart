import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_fancy_image.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/custom_widget_folder/custom._container.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

class NotificationContainer extends StatelessWidget {
  final String firstText, image, message;

  const NotificationContainer(
      {Key? key,
      required this.firstText,
      required this.image,
      required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      radius: 20,
      child: Row(children: [
        //----------------Image Sized Box----------------
        imageWidget(),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //----------------Main Text----------------
                textWidget(),
                SizedBox(height: 5.h),
                //----------------Skilled Nursing Text----------------
                skilledNursingWidget(),
              ]),
        ),
      ]),
    );
  }

  Widget imageWidget() {
    return SizedBox(
        width: 70.w,
        height: 80.h,
        child: CustomFancyImage(image: NetworkStrings.baseUrl + image));
  }

  Widget textWidget() {
    return CustomText(
        maintext: firstText,
        fontsize: 18.sp,
        color: AppColors.PURPLE_COLOR,
        fontWeight: FontWeight.w500);
  }

  Widget skilledNursingWidget() {
    return CustomText(maintext: message, fontsize: 15.sp,color: AppColors.GREY_COLOR,);
  }
}
