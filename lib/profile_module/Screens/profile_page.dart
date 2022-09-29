import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_fancy_image.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

final box = GetStorage();

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(children: [
        SizedBox(height: 0.03.h),
        //----------------Profile Pic And Edit ----------------
        profileicAndEditButtonWidget(),
        //----------------Full Name Text----------------
        fullNameWidget(),
        //----------------Email Address Text----------------
        emailAddressWidget(),
        //Need nahi hey app mein
        // //----------------Payment Method Text----------------
        // SizedBox(height: 0.03.sh),
        // optionArea(
        //     maintext: AppStrings.PAYMENT_METHOD_OPTION_TEXT,
        //     link: () {
        //       Get.toNamed(Paths.PAYMENT_METHOD_SCREEN_ROUTE);
        //     }),
        //----------------Notification Settings Text----------------
        SizedBox(
          height: 60.h,
        ),
        // Need nahi hey app mein
        // // optionArea(
        // //     maintext: AppStrings.NOTIFICATION_SETTINGS_OPTION_TEXT,
        // //     link: () {
        // //       Get.toNamed(Paths.NOTIFICATION_SETTING_SCREEN_ROUTE);
        // //     }),
        //----------------Documents Text----------------
        optionArea(
            maintext: AppStrings.DOCUMENTS_OPTION_TEXT,
            link: () {
              Get.toNamed(Paths.DOCUMENTS_SCREEN_ROUTE);
            }),
        //Need nahi hey app mein
        // //----------------Rating Reviews Text----------------
        // optionArea(
        //     maintext: AppStrings.RATINGS_REVIEWS_OPTION_TEXT,
        //     link: () {
        //       Get.toNamed(Paths.RATING_REVIEWS_SCREEN_ROUTE);
        //     }),
        //----------------My TimeSheet Text----------------
        optionArea(
            maintext: AppStrings.MY_TIMESHEETS_OPTION_TEXT,
            link: () {
              Get.toNamed(Paths.TIME_SHEET_SCREEN_ROUTE);
            }),
        //Need nahi hey app mein
        // //----------------Covid Preferences Text----------------
        // optionArea(
        //     maintext: AppStrings.COVID_PREFERENCES_OPTION_TEXT,
        //     link: () {
        //       Get.toNamed(Paths.COVID_PREFERENCES_SCREEN_ROUTE);
        //     }),
        SizedBox(height: 80.h)
      ]),
    );
  }

  Widget optionArea({maintext, link}) {
    return Column(children: [
      InkWell(
        onTap: link,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CustomText(maintext: maintext),
          Icon(Icons.keyboard_arrow_right_rounded, size: 30.w),
        ]),
      ),
      Divider(color: AppColors.GREY_COLOR, height: 9.h, thickness: 1),
      SizedBox(height: 0.02.sh),
    ]);
  }

  Widget profileicAndEditButtonWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        box.read("user_Image") != null
            ? Container(
                width: 140.0,
                height: 140.0,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.PURPLE_COLOR, width: 5.w),
                    shape: BoxShape.circle),
                child: ClipOval(
                  child: CustomFancyImage(
                      image: NetworkStrings.baseUrl + box.read("user_Image"),
                      is_proile: true),
                ))
            : CircleAvatar(
                radius: 67.sp,
                backgroundColor: AppColors.PURPLE_COLOR,
                child: CircleAvatar(
                    backgroundImage:
                        const AssetImage(AssetPaths.AVATAR_MALE_IMAGE),
                    radius: 63.sp)),
        SizedBox(width: 10.w),
        SizedBox(
          width: 90.w,
          height: 35.h,
          child: CustomButton(
              fontsize: 15.sp,
              iconsize: 4.w,
              btnimg: AssetPaths.EDIT_ICON,
              text: AppStrings.EDIT_BUTTON_TEXT,
              onclick: () {
                Get.toNamed(
                  Paths.EDIT_PROFILE_SCREEN_ROUTE,
                );
              }),
        ),
      ],
    );
  }

  Widget fullNameWidget() {
    return CustomText(
        is_alignLeft: false,
        fontsize: 20.sp,
        maintext: box.read("full_name"),
        color: AppColors.PURPLE_COLOR);
  }

  Widget emailAddressWidget() {
    return CustomText(is_alignLeft: false, maintext: box.read("user_email"));
  }
}
