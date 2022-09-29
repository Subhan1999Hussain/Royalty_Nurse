import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/auth_module/Controller/prelogin_controller.dart';
import 'package:royalty_nurse/auth_module/Screens/terms_privacy_alert_box.dart';
import 'package:royalty_nurse/custom_widget_folder/app_logo.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_padding.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class PreLogin extends StatelessWidget {
  final PreLoginController preloginController = Get.put(PreLoginController());

  PreLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
        is_changeImage: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: screeen_padding.screenPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //----------------App Logo----------------
                AppLogo(),
                SizedBox(height: 0.12.sh),
                //----------------Social Login Text----------------
                socialLoginWidget(),
                SizedBox(height: 0.001.sh),
                //----------------Login Using Social Account Text----------------
                loginUsingSocialAccountWidget(),
                SizedBox(height: 0.03.sh),
                //----------------Email Button----------------
                emailButtonWidget(),
                SizedBox(height: 0.02.sh),
                //----------------Google Button----------------
                googleButtonWidget(context),
                SizedBox(height: 0.02.sh),
                //----------------Apple Button----------------
                appleButtonWidget(context),
              ],
            ),
          ),
        ));
  }

  Widget socialLoginWidget() {
    return CustomText(
        maintext: AppStrings.SOCIAL_LOGIN_TEXT,
        color: AppColors.PURPLE_COLOR,
        fontWeight: FontWeight.bold,
        fontsize: 38.sp);
  }

  Widget loginUsingSocialAccountWidget() {
    return CustomText(maintext: AppStrings.LOGIN_USING_SOCIAL_ACCOUNT_TEXT);
  }

  Widget emailButtonWidget() {
    return CustomButton(
        text: AppStrings.SIGNIN_WITH_EMAIL_BUTTON_TEXT,
        btnimg: AssetPaths.EMAIL_ICON,
        textcolor: AppColors.BLACK_COLOR,
        onclick: () {
          Get.toNamed(Paths.LOGIN_SCREEN_ROUTE);
        });
  }

  Widget googleButtonWidget(BuildContext context) {
    return CustomButton(
        is_gradient: false,
        text: AppStrings.SIGNIN_WITH_GOOGLE_BUTTON_TEXT,
        btnimg: AssetPaths.GOOGLE_ICON,
        color: AppColors.GOOGLE_BUTTON_COLOR,
        textcolor: AppColors.WHITE_COLOR,
        onclick: () {
          showDialog(
              context: context,
              builder: (context) =>
                  const TermsPrivacyAlertBox(response: "google"));
        });
  }

  Widget appleButtonWidget(BuildContext context) {
    return Platform.isIOS
        ? CustomButton(
            is_gradient: false,
            text: AppStrings.SIGNIN_WITH_APPLE_BUTTON_TEXT,
            btnimg: AssetPaths.APPLE_ICON,
            color: AppColors.BLACK_COLOR,
            textcolor: AppColors.WHITE_COLOR,
            onclick: () {
              showDialog(
                  context: context,
                  builder: (context) =>
                      const TermsPrivacyAlertBox(response: "apple"));
            })
        : const SizedBox();
  }
}
