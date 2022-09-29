import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/utils/app_color.dart';

class sliderWidget extends StatelessWidget {
  final String maintext, mintext;
  String? maxtext;
  final double minVal, maxVal;
  double? selectedValue, startRange, endRange;
  final int divission;
  bool? is_range;
  void Function(double)? onchange;
  void Function(RangeValues)? onchangeRange;
  sliderWidget({
    Key? key,
    required this.maintext,
    required this.mintext,
    this.maxtext,
    required this.minVal,
    required this.maxVal,
    this.selectedValue,
    this.startRange,
    this.endRange,
    required this.divission,
    this.is_range = false,
    this.onchange,
    this.onchangeRange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //----------------Main Title Text----------------
      mainTitleWidget(),
      is_range != true
          //----------------Slider----------------
          ? normalSlider()
          //----------------Range Slider----------------
          : rangeSlider(),
      //----------------Min Max Text----------------
      minMaxTextWidget(),
    ]);
  }

  Widget normalSlider() {
    return Slider(
        min: minVal,
        max: maxVal,
        value: selectedValue ?? 0,
        divisions: divission,
        activeColor: AppColors.PURPLE_COLOR,
        inactiveColor: AppColors.PURPLE_COLOR.withOpacity(0.2),
        onChanged: onchange);
  }

  Widget rangeSlider() {
    return RangeSlider(
        values: RangeValues(startRange ?? 0, endRange ?? 0),
        min: minVal,
        max: maxVal,
        divisions: divission,
        activeColor: AppColors.PURPLE_COLOR,
        inactiveColor: AppColors.PURPLE_COLOR.withOpacity(0.2),
        onChanged: onchangeRange);
  }

  Widget mainTitleWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomText(
          maintext: maintext,
          fontWeight: FontWeight.w800,
          color: AppColors.PURPLE_COLOR),
    );
  }

  Widget minMaxTextWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(maintext: mintext),
          CustomText(maintext: maxtext),
        ],
      ),
    );
  }
}
