import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_app_bar.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class BackgroundImage extends StatelessWidget {
  final String? title;
  final String? isLeading;
  final String? isAction;
  final String? actionText;
  bool? is_bottomNav;
  void Function()? onclickLead, onclickAction;
  final Widget child;
  bool? is_changeImage;
  BackgroundImage(
      {Key? key,
      required this.child,
      this.is_changeImage = false,
      this.is_bottomNav = false,
      this.title,
      this.isLeading,
      this.isAction,
      this.onclickLead,
      this.onclickAction,
      this.actionText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1..sh,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              is_changeImage == true
                  ? AssetPaths.BACKGROUND_IMAGE
                  : AssetPaths.BACKGROUND_SECONDARY_IMAGE,
            ),
            fit: BoxFit.fill),
      ),
      child: is_bottomNav != true ? scaffoldWidget(context) : child,
    );
  }

  Widget scaffoldWidget(context) {
    return Scaffold(
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        appBar: CustumAppBar(context, title, isLeading, onclickLead, actionText,
            isAction, onclickAction),
        body: child);
  }
}
