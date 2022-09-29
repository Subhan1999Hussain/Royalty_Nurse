import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/utils/app_color.dart';

class CustomTab extends StatefulWidget {
  final String firstTXT, secondTXT;
  final Widget firstWidget, secondWidget;

  const CustomTab(
      {Key? key,
      required this.firstTXT,
      required this.secondTXT,
      required this.firstWidget,
      required this.secondWidget})
      : super(key: key);

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: 8.0.h),
        height: 47.h,
        decoration: BoxDecoration(
            color: AppColors.WHITE_COLOR,
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(width: 4.sp, color: AppColors.WHITE_COLOR),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 3,
                  offset: const Offset(0, 3),
                  color: AppColors.GREY_COLOR.withOpacity(0.2))
            ]),
        child: TabBar(
            controller: tabController,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              gradient: const LinearGradient(colors: [
                AppColors.BOTTOM_GRADIENT6_COLOR,
                AppColors.BOTTOM_GRADIENT2_COLOR
              ]),
            ),
            labelColor: AppColors.WHITE_COLOR,
            unselectedLabelColor: AppColors.GREY_COLOR,
            tabs: [
              Tab(
                child: CustomText(
                    maintext: widget.firstTXT,
                    fontsize: 15.sp,
                    is_alignLeft: false),
              ),
              Tab(
                child: CustomText(
                    maintext: widget.secondTXT,
                    fontsize: 15.sp,
                    is_alignLeft: false),
              ),
            ]),
      ),
      Expanded(
        child: TabBarView(
            controller: tabController,
            children: [widget.firstWidget, widget.secondWidget]),
      ),
    ]);
  }
}
