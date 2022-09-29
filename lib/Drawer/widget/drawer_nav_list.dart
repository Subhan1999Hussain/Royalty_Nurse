import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:royalty_nurse/Drawer/Controller/logout_controller.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_fancy_image.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

final box = GetStorage();

class DrawerNavList extends StatelessWidget {
  final LogoutController logoutController = Get.put(LogoutController());

  DrawerNavList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      //---------------------Drawer Header------------------------------------
      drawerHeaderWidget(),
      //--------------------------Home------------------------------------
      listTile(AssetPaths.HOME_ICON, AppStrings.HOME_TEXT, () {
        Get.back();
      }),
      //----------------------Check Social Type-------------------------------
      box.read("social") != null
          ? SizedBox()
          //----------------------Change Password-------------------------------
          : listTile(AssetPaths.LOCK_ICON, AppStrings.CHANGE_PASSWORD_TEXT, () {
              Get.back();
              Get.toNamed(Paths.CHANGE_PASSWORD_SCREEN_ROUTE);
            }),
      //----------------------Terms and Condition-------------------------------
      listTile(AssetPaths.TERMS_ICON, AppStrings.TERMS_CONDITION_TEXT, () {
        Get.toNamed(Paths.TERMS_CONDITION_SCREEN_ROUTE);
      }),
      //------------------------Privacy Policy----------------------------------
      listTile(AssetPaths.PRIVACY_ICON, AppStrings.PRIVACY_POLICY_TEXT, () {
        Get.toNamed(Paths.PRIVACY_POLICY_SCREEN_ROUTE);
      }),
      //----------------------------Sign Out------------------------------------
      listTile(AssetPaths.SIGNOUT_ICON, AppStrings.SIGNOUT_TEXT, () {
        logoutController.logOut();
      }),
    ]);
  }

  Widget listTile(imagePath, mainText, onTap) {
    return ListTile(
        leading: Image.asset(
          imagePath,
          scale: 2.5.w,
        ),
        title: CustomText(
            maintext: mainText, fontsize: 22.sp, color: AppColors.PURPLE_COLOR),
        onTap: onTap);
  }

  Widget drawerHeaderWidget() {
    return SizedBox(
      height: 250.h,
      child: DrawerHeader(
        child: Column(
          children: [
            box.read("user_Image") != null
                ? Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.PURPLE_COLOR,
                        width: 3.w,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: CustomFancyImage(
                          image:
                              NetworkStrings.baseUrl + box.read("user_Image"),is_proile: true),
                    ),
                  )
                : CircleAvatar(
                    radius: 47.sp,
                    backgroundColor: AppColors.PURPLE_COLOR,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(AssetPaths.AVATAR_MALE_IMAGE),
                      radius: 43.sp,
                    ),
                  ),
            //---------------------Full Name------------------------------------
            fullNameWidget(),
            //----------------------User Email----------------------------------
            userEmailWidget(),
          ],
        ),
      ),
    );
  }

  Widget fullNameWidget() {
    return CustomText(
        is_alignLeft: false,
        fontsize: 20.sp,
        maintext: box.read("full_name"),
        color: AppColors.WHITE_COLOR);
  }

  Widget userEmailWidget() {
    return CustomText(
        is_alignLeft: false,
        maintext: box.read("user_email"),
        color: AppColors.WHITE_COLOR);
  }
}
