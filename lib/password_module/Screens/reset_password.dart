import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/app_logo.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_bottom_container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text_field.dart';
import 'package:royalty_nurse/password_module/Controller/reset_password_controller.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_padding.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';
import 'package:royalty_nurse/utils/validation.dart';

class resetPassword extends StatelessWidget {
  final ResetPasswordController resetController =
      Get.put(ResetPasswordController());

  resetPassword({Key? key}) : super(key: key);
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
          AppLogo(),
          SizedBox(height: 0.1.sh),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(
                () => Form(
                  key: resetController.resetpasswordFormkey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(children: [
                    //----------------Welcome Text----------------
                    resetPasswordWidget(),
                    SizedBox(height: 0.001.sh),
                    //----------------Login To Your Account Text----------------
                    resetYourPasswordWidget(),
                    SizedBox(height: 0.04.sh),
                    //----------------Password Field----------------
                    passwordWidget(),
                    SizedBox(height: 0.01.sh),
                    //----------------Confirm Password Field----------------
                    confirmPasswordWidget(),
                    SizedBox(height: 0.12.sh),
                    //----------------Reset Button----------------
                    resetButtonWidget(),
                    //----------------Already have an Account----------------
                    alreadyHaveAnAccountWidget(),
                  ]),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget resetPasswordWidget() {
    return CustomText(
        maintext: AppStrings.RESET_PASSWORD_TEXT,
        color: AppColors.PURPLE_COLOR,
        fontWeight: FontWeight.bold,
        fontsize: 32.sp);
  }

  Widget resetYourPasswordWidget() {
    return CustomText(maintext: AppStrings.RESET_YOUR_PASSWORD_TEXT);
  }

  Widget passwordWidget() {
    return CustomTextField(
        hint: AppStrings.PASSWORD_FIELD_TEXT,
        prefxicon: AssetPaths.LOCK_ICON,
        prefixIconSize: 18.w,
        sufixicon: FieldValidator.isHidepassword.value
            ? AssetPaths.PASSWORD_SHOW
            : AssetPaths.PASSWORD_HIDE,
        obscureText: FieldValidator.isHidepassword.value,
        onclick: () {
          FieldValidator.password_hideIcon();
        },
        controller: resetController.passwordController,
        onsave: (value) {
          resetController.password = value!;
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
        sufixicon: FieldValidator.isHideconfirmpassword.value
            ? AssetPaths.PASSWORD_SHOW
            : AssetPaths.PASSWORD_HIDE,
        obscureText: FieldValidator.isHideconfirmpassword.value,
        onclick: () {
          FieldValidator.confirm_password_hideIcon();
        },
        onsave: (value) {},
        validator: (value) {
          return FieldValidator.validateConfirmPassword(
              resetController.passwordController.text, value!);
        });
  }

  Widget resetButtonWidget() {
    return CustomButton(
        text: AppStrings.RESET_BUTTON_TEXT,
        onclick: () {
          resetController.checkReset();
        });
  }

  Widget alreadyHaveAnAccountWidget() {
    return CustomBottomContainer(
        starttext: AppStrings.ALREADY_HAVE_AN_ACCOUNT_TEXT,
        endtext: AppStrings.LOGIN_BOTTOM_TEXT,
        onclick: () {
          Get.offAllNamed(
            Paths.LOGIN_SCREEN_ROUTE,
          );
        });
  }
}
