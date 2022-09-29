import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/utils/app_color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  String? btnimg;
  Color? color;
  final Color? textcolor;
  final double? fontsize, height, iconsize;
  bool? is_gradient;
  final Function()? onclick;

  CustomButton(
      {Key? key,
      required this.text,
      this.btnimg,
      this.color,
      this.fontsize,
      this.height,
      this.iconsize,
      this.textcolor,
      this.is_gradient = true,
      this.onclick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: height ?? 0.07.sh,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: is_gradient == false ? color : null,
          gradient: is_gradient == true
              ? const LinearGradient(colors: [
                  AppColors.BUTTON_GRADIENT1_COLOR,
                  AppColors.BUTTON_GRADIENT2_COLOR,
                  AppColors.BUTTON_GRADIENT3_COLOR,
                  AppColors.BUTTON_GRADIENT4_COLOR,
                ])
              : null,
          borderRadius: BorderRadius.circular(35),
        ),
        child: ElevatedButton(
          onPressed: onclick,
          style: ElevatedButton.styleFrom(
              primary: AppColors.TRANSPARENT_COLOR,
              onSurface: AppColors.TRANSPARENT_COLOR,
              shadowColor: AppColors.TRANSPARENT_COLOR),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            btnimg != null
                ? Image.asset(btnimg!, scale: iconsize ?? 3.w)
                : const SizedBox(width: 0.0),
            SizedBox(width: btnimg != null ? 10.w : 0.0),
            Text(
              text,
              style: TextStyle(
                  color: textcolor ?? AppColors.BLACK_COLOR,
                  fontSize: fontsize ?? 18.sp),
            ),
          ]),
        ),
      ),
    );
  }
}
