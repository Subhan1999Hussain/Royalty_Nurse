import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';

class CustomSinglePreference extends StatefulWidget {
  final String firstText;

  const CustomSinglePreference({
    Key? key,
    required this.firstText,
  }) : super(key: key);

  @override
  State<CustomSinglePreference> createState() => _CustomSinglePreferenceState();
}

class _CustomSinglePreferenceState extends State<CustomSinglePreference> {
  bool val = true;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mainTextWidget(),
          switchButtonWidget(),
        ]);
  }

  Widget mainTextWidget() {
    return CustomText(
        maintext: widget.firstText,
        color: AppColors.PURPLE_COLOR,
        fontsize: 22.sp);
  }

  Widget switchButtonWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      CustomText(maintext: AppStrings.NO_TEXT),
      SizedBox(width: 5.w),
      CupertinoSwitch(
          value: val,
          onChanged: (bool value) {
            setState(() {
              val = value;
            });
          }),
      SizedBox(width: 5.w),
      CustomText(maintext: AppStrings.YES_TEXT),
    ]);
  }
}
