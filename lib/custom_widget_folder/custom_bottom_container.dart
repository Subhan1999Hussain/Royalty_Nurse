import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import '../Utils/app_strings.dart';

class CustomBottomContainer extends StatelessWidget {
  final String starttext, endtext;
  double? fontsize;
  final Function()? onclick;
  CustomBottomContainer(
      {Key? key,
      required this.starttext,
      required this.endtext,
      this.fontsize,
      this.onclick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.05.sh),
      child: InkWell(
        onTap: onclick,
        child: RichText(
          text: TextSpan(
              style: TextStyle(
                  color: AppColors.BLACK_COLOR,
                  fontFamily: AppStrings.FONT_ROBOTO_CONDENSED,
                  fontSize: fontsize ?? 17.sp),
              text: starttext,
              children: [
                TextSpan(
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: AppColors.PURPLE_COLOR),
                    text: endtext),
              ]),
        ),
      ),
    );
  }
}
