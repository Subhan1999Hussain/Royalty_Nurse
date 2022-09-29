import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/utils/app_color.dart';

class CustomContainer extends StatelessWidget {
  Widget child;
  double? height, radius;

  CustomContainer({
    Key? key,
    required this.child,
    this.height,
    this.radius,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4.w, 19.h, 4.w, 0.0),
      child: Container(
          width: 1.sw,
          height: height,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppColors.PURPLE_COLOR.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 3,
                  offset: const Offset(0, 1)),
            ],
            borderRadius: BorderRadius.circular(radius ?? 25.0),
            color: AppColors.WHITE_COLOR,
            border: Border.all(
                color: Color.fromARGB(255, 255, 255, 255), width: 4.w),
          ),
          child: child),
    );
  }
}
