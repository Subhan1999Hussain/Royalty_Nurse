import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/utils/app_color.dart';

PreferredSizeWidget? CustumAppBar(
  BuildContext context,
  final String? title,
  final String? isLeading,
  void Function()? onclickLead,
  final String? actionText,
  final String? isAction,
  void Function()? onclickAction,
) {
  return AppBar(
      backgroundColor: AppColors.TRANSPARENT_COLOR,
      elevation: 0.0,
      title: Text(
        title ?? "",
        style: TextStyle(color: AppColors.WHITE_COLOR, fontSize: 22.sp),
      ),
      centerTitle: true,
      leading: isLeading != null
          ? InkWell(
              onTap: onclickLead,
              child: Image.asset(isLeading,
                  scale: 3.5.w, alignment: Alignment.center),
            )
          : const SizedBox(),
      actions: [
        isAction != null
            ? InkWell(
                onTap: onclickAction,
                child: actionText != null
                    ? Padding(
                        padding: EdgeInsets.only(right: 8.0.w),
                        child: CustomText(
                            maintext: actionText, color: AppColors.WHITE_COLOR),
                      )
                    : Image.asset(isAction,
                        scale: 3.5.w, alignment: Alignment.center),
              )
            : const SizedBox(),
      ]);
}
