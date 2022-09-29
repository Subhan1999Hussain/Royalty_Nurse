import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/auth_module/Controller/login_controller.dart';
import 'package:royalty_nurse/custom_widget_folder/app_logo.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text_field.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_bottom_container.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_padding.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';
import 'package:royalty_nurse/utils/validation.dart';

class LogIn extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      isLeading: AssetPaths.BACK_ICON,
      onclickLead: () {
        Get.back();
      },
      is_changeImage: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: screeen_padding.screenPadding),
        child: Column(children: [
          //----------------App Logo----------------
          AppLogo(),
          SizedBox(height: 0.07.sh),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(
                () => Form(
                  key: loginController.loginFormkey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(children: [
                    //----------------Welcome Text----------------
                    welcomeWidget(),
                    SizedBox(height: 0.001.sh),
                    //----------------Login To Your Account Text----------------
                    loginToYourAccountWidget(),
                    SizedBox(height: 0.03.sh),
                    //----------------Email Address Field----------------
                    emailAddressWidget(),
                    SizedBox(height: 3.h),
                    //----------------Password Field----------------
                    passwordWidget(),
                    SizedBox(height: 0.05.sh),
                    //----------------Forget Password Text----------------
                    forgetPasswordWidget(),
                    SizedBox(height: 0.05.sh),
                    //----------------Login Button----------------
                    loginButtonWidget(),
                    //----------------Dont have an Account----------------
                    dontHaveAnAccountWidget(),
                  ]),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget welcomeWidget() {
    return CustomText(
        maintext: AppStrings.WELCOME_TEXT,
        color: AppColors.PURPLE_COLOR,
        fontWeight: FontWeight.bold,
        fontsize: 32.sp);
  }

  Widget loginToYourAccountWidget() {
    return CustomText(maintext: AppStrings.LOGIN_TO_YOUR_ACCOUNT_TEXT);
  }

  Widget emailAddressWidget() {
    return CustomTextField(
        hint: AppStrings.EMAIL_FIELD_TEXT,
        prefxicon: AssetPaths.EMAIL2_ICON,
        prefixIconSize: 22.w,
        prefixRIghtPadding: 15.w,
        sufixRIghtPadding: 1.w,
        controller: loginController.emailController,
        onsave: (value) {
          loginController.email = value!;
        },
        validator: (value) {
          return FieldValidator.validateEmail(value!);
        });
  }

  Widget passwordWidget() {
    return CustomTextField(
        hint: AppStrings.PASSWORD_FIELD_TEXT,
        prefxicon: AssetPaths.LOCK_ICON,
        prefixIconSize: 18.w,
        prefixRIghtPadding: 15.w,
        sufixicon: FieldValidator.isHidepassword.value
            ? AssetPaths.PASSWORD_SHOW
            : AssetPaths.PASSWORD_HIDE,
        obscureText: FieldValidator.isHidepassword.value,
        onclick: () {
          FieldValidator.password_hideIcon();
        },
        controller: loginController.passwordController,
        onsave: (value) {
          loginController.password = value!;
        },
        validator: (value) {
          return FieldValidator.validatePassword(value!);
        });
  }

  Widget forgetPasswordWidget() {
    return GestureDetector(
        onTap: (() {
          Get.toNamed(Paths.FORGOT_PASSWORD__SCREEN_ROUTE);
        }),
        child: CustomText(
            maintext: AppStrings.FORGOT_PASSWORD_TEXT,
            color: AppColors.BLACK_COLOR,
            fontsize: 18.0.sp,
            is_alignLeft: false));
  }

  Widget loginButtonWidget() {
    return CustomButton(
        text: AppStrings.LOGIN_BUTTON_TEXT,
        onclick: () {
          loginController.checkLogin();
        });
  }

  Widget dontHaveAnAccountWidget() {
    return CustomBottomContainer(
        starttext: AppStrings.DONT_HAVE_AN_ACCOUNT_TEXT,
        endtext: AppStrings.SIGNUP_BOTTOM_TEXT,
        onclick: () {
          Get.toNamed(Paths.SIGNUP_SCREEN_ROUTE);
        });
  }
}
