import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_padding.dart';

class CustomMainContainer extends StatelessWidget {
  final Widget child;
  bool? is_padding;
  CustomMainContainer({
    Key? key,
    required this.child,
    this.is_padding = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(55.0), topRight: Radius.circular(55.0)),
          color: AppColors.WHITE_COLOR),
      child: is_padding != false
          ? Padding(
              padding: const EdgeInsets.fromLTRB(
                  screeen_padding.screenPadding,
                  screeen_padding.screenPadding,
                  screeen_padding.screenPadding,
                  0.0),
              child: child)
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w), child: child),
    );
  }
}
