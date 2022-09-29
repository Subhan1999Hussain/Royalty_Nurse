import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/auth_module/Controller/signup_controller.dart';
import 'package:royalty_nurse/auth_module/Screens/terms_privacy_alert_box.dart';
import 'package:royalty_nurse/custom_widget_folder/app_logo.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_bottom_container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text_field.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_padding.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';
import 'package:royalty_nurse/utils/validation.dart';

class SignUp extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());

  SignUp({Key? key}) : super(key: key);

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
              SizedBox(height: 50.h),
              Expanded(
                  child: SingleChildScrollView(
                      child: Obx(() => Form(
                          key: signupController.signupFormkey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(children: [
                            //----------------Create Account Text----------------
                            createAccountWidget(),
                            SizedBox(height: 0.001.sh),
                            //----------------Create Your Account----------------
                            createYourAccountWidget(),
                            SizedBox(height: 0.02.sh),
                            //----------------Email Address Field----------------
                            emailAddressWidget(),
                            SizedBox(height: 3.h),
                            //----------------Password Field----------------
                            passwordWidget(),
                            SizedBox(height: 3.h),
                            //----------------Confirm Password Field----------------
                            confirmPasswordWidget(),
                            SizedBox(height: 0.05.sh),
                            //----------------SignUp Button----------------
                            signupButtonWidget(context),
                            //----------------Already have an Account----------------
                            alreadyHaveAccountWidget(),
                          ])))))
            ])));
  }

  Widget createAccountWidget() {
    return CustomText(
        maintext: AppStrings.CREATE_ACCOUNT_TEXT,
        color: AppColors.PURPLE_COLOR,
        fontWeight: FontWeight.bold,
        fontsize: 32.sp);
  }

  Widget createYourAccountWidget() {
    return CustomText(maintext: AppStrings.CREATE_YOUR_ACCOUNT_TEXT);
  }

  Widget emailAddressWidget() {
    return CustomTextField(
        hint: AppStrings.EMAIL_FIELD_TEXT,
        prefxicon: AssetPaths.EMAIL2_ICON,
        prefixIconSize: 22.w,
        prefixRIghtPadding: 15.w,
        sufixRIghtPadding: 1.w,
        controller: signupController.emailController,
        onsave: (value) {
          signupController.email = value!;
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
        controller: signupController.passwordController,
        onsave: (value) {
          signupController.password = value!;
        },
        validator: (value) {
          return FieldValidator.validatePassword(value!);
        });
  }

  Widget confirmPasswordWidget() {
    return CustomTextField(
        hint: AppStrings.CONFIRM_PASSWORD_FIELD_TEXT,
        prefxicon: AssetPaths.LOCK_ICON,
        prefixIconSize: 18.w,
        prefixRIghtPadding: 15.w,
        sufixicon: FieldValidator.isHideconfirmpassword.value
            ? AssetPaths.PASSWORD_SHOW
            : AssetPaths.PASSWORD_HIDE,
        obscureText: FieldValidator.isHideconfirmpassword.value,
        onclick: () {
          FieldValidator.confirm_password_hideIcon();
        },
        controller: signupController.confirmPasswordController,
        onsave: (value) {
          signupController.confirmpassword = value!;
        },
        validator: (value) {
          return FieldValidator.validateConfirmPassword(
              signupController.passwordController.text, value!);
        });
  }

  Widget signupButtonWidget(BuildContext context) {
    return CustomButton(
        text: AppStrings.SIGN_UP_BUTTON_TEXT,
        onclick: () {
          final isValid =
              signupController.signupFormkey.currentState!.validate();
          if (!isValid) {
            return;
          } else {
            signupController.signupFormkey.currentState!.save();

            showDialog(
                context: context,
                builder: (context) =>
                    const TermsPrivacyAlertBox(response: "signup"));
          }
        });
  }

  Widget alreadyHaveAccountWidget() {
    return CustomBottomContainer(
        starttext: AppStrings.ALREADY_HAVE_AN_ACCOUNT_TEXT,
        endtext: AppStrings.LOGIN_BOTTOM_TEXT,
        onclick: () {
          Get.toNamed(Paths.LOGIN_SCREEN_ROUTE);
        });
  }
}
