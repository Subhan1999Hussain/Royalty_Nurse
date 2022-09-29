import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/utils/app_color.dart';

class CustomText extends StatelessWidget {
  String? maintext;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontsize;
  bool is_alignLeft;
  CustomText(
      {Key? key,
      this.maintext,
      this.color,
      this.fontWeight,
      this.fontsize,
      this.is_alignLeft = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: is_alignLeft ? Alignment.centerLeft : Alignment.center,
      child: Text(
        textAlign: is_alignLeft != false ? TextAlign.left : TextAlign.center,
        maintext ?? "",
        style: TextStyle(
            fontSize: fontsize ?? 18.sp,
            color: color,
            fontWeight: fontWeight ?? FontWeight.normal),
      ),
    );
  }
}
