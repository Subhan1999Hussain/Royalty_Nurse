import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/Drawer/Screens/drawer_nav.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_app_bar.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_main_container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/profile_module/Screens/profile_page.dart';
import 'package:royalty_nurse/shift_module/Controller/clock_controller.dart';
import 'package:royalty_nurse/shift_module/Controller/find_shift_controller.dart';
import 'package:royalty_nurse/shift_module/Controller/upcoming_privous_shift_controller.dart';
import 'package:royalty_nurse/shift_module/Screens/find_screen.dart';
import 'package:royalty_nurse/shift_module/Screens/my_shift.dart';
import 'package:royalty_nurse/shift_module/Screens/shift_clock.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  static const List title_LIST = ["Find", "My Shift", "My Shift", "Profile"];
  final pages = [FindScreen(), MyShift(), ShiftClock(), const ProfilePage()];
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final FindShiftController findShiftController =
      Get.put(FindShiftController());
  final UpcomingPrivousShiftControllerController
      upcomingPreviousShiftController =
      Get.put(UpcomingPrivousShiftControllerController());
  final ClockController todayShiftController = Get.put(ClockController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetPaths.BACKGROUND_SECONDARY_IMAGE),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        key: _key,
        appBar: CustumAppBar(
            context,
            title_LIST[pageIndex],
            AssetPaths.DRAWER_ICON,
            () {
              _key.currentState!.openDrawer();
            },
            null,
            AssetPaths.NOTIFICATION_ICON,
            () {
              Get.toNamed(Paths.NOTIFICATION_PAGE_SCREEN_ROUTE);
            }),
        drawer: const DrawerNav(),
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        body: CustomMainContainer(child: pages[pageIndex]),
        //----------------Bottom Navigation Bar----------------
        bottomNavigationBar: bottomNavigationBarWidget(),
      ),
    );
  }

  Widget bottomNavigationBarWidget() {
    return Container(
      height: 60.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.BOTTOM_GRADIENT6_COLOR,
          AppColors.BOTTOM_GRADIENT2_COLOR,
        ]),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        //----------------find Menu----------------
        findMenuWidget(),
        //----------------My Shift Menu----------------
        myShiftMenuWidget(),
        //----------------Clock Menu----------------
        clockMenuWidget(),
        //----------------Profile Menu----------------
        profileMenuWidget(),
      ]),
    );
  }

  Widget findMenuWidget() {
    return InkWell(
      onTap: () {
        setState(() {
          pageIndex = 0;
          findShiftController.findShift();
        });
      },
      child: pageIndex == 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                  Image.asset(AssetPaths.SEARCH_ICON,
                      color: AppColors.WHITE_COLOR, scale: 4.w),
                  CustomText(
                      maintext: AppStrings.FIND_TEXT,
                      color: AppColors.WHITE_COLOR)
                ])
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                  Image.asset(AssetPaths.SEARCH_ICON,
                      color: AppColors.BOTTOM_GRADIENT1_COLOR, scale: 4.w),
                  CustomText(
                      maintext: AppStrings.FIND_TEXT,
                      color: AppColors.BOTTOM_GRADIENT1_COLOR)
                ]),
    );
  }

  Widget myShiftMenuWidget() {
    return InkWell(
      onTap: () {
        setState(() {
          pageIndex = 1;
          upcomingPreviousShiftController.shift(
              true, NetworkStrings.upComingShiftEndpont);
          upcomingPreviousShiftController.shift(
              false, NetworkStrings.previousShftEndpont);
        });
      },
      child: pageIndex == 1
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                  Image.asset(AssetPaths.MY_SHIFT_BUTTON_ICON,
                      color: AppColors.WHITE_COLOR, scale: 4.w),
                  CustomText(
                      maintext: AppStrings.MY_SHIFTS_TEXT,
                      color: AppColors.WHITE_COLOR)
                ])
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                  Image.asset(AssetPaths.MY_SHIFT_BUTTON_ICON,
                      color: AppColors.BOTTOM_GRADIENT1_COLOR, scale: 4.w),
                  CustomText(
                      maintext: AppStrings.MY_SHIFTS_TEXT,
                      color: AppColors.BOTTOM_GRADIENT1_COLOR)
                ]),
    );
  }

  Widget clockMenuWidget() {
    return InkWell(
      onTap: () {
        setState(() {
          pageIndex = 2;
          todayShiftController.todayshift();
        });
      },
      child: pageIndex == 2
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                  Image.asset(AssetPaths.CLOCK_BUTTON_ICON,
                      color: AppColors.WHITE_COLOR, scale: 4.w),
                  CustomText(
                      maintext: AppStrings.CLOCK_TEXT,
                      color: AppColors.WHITE_COLOR)
                ])
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                  Image.asset(AssetPaths.CLOCK_BUTTON_ICON,
                      color: AppColors.BOTTOM_GRADIENT1_COLOR, scale: 4.w),
                  CustomText(
                      maintext: AppStrings.CLOCK_TEXT,
                      color: AppColors.BOTTOM_GRADIENT1_COLOR)
                ]),
    );
  }

  Widget profileMenuWidget() {
    return InkWell(
      onTap: () {
        setState(() {
          pageIndex = 3;
        });
      },
      child: pageIndex == 3
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                  Image.asset(AssetPaths.PROFILE_BUTTON_ICON,
                      color: AppColors.WHITE_COLOR, scale: 4.w),
                  CustomText(
                      maintext: AppStrings.PROFILE_TEXT,
                      color: AppColors.WHITE_COLOR)
                ])
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                  Image.asset(AssetPaths.PROFILE_BUTTON_ICON,
                      color: AppColors.BOTTOM_GRADIENT1_COLOR, scale: 4.w),
                  CustomText(
                      maintext: AppStrings.PROFILE_TEXT,
                      color: AppColors.BOTTOM_GRADIENT1_COLOR)
                ]),
    );
  }
}
