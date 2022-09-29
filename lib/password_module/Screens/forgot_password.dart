import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/app_logo.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text_field.dart';
import 'package:royalty_nurse/password_module/Controller/forgot_password_controller.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_padding.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';
import 'package:royalty_nurse/utils/validation.dart';

class ForgotPassword extends StatelessWidget {
  final ForgotPasswordController forgotController =
      Get.put(ForgotPasswordController());

  ForgotPassword({Key? key}) : super(key: key);

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
          SizedBox(height: 0.12.sh),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: forgotController.forgotFormkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(children: [
                  //----------------Forgot Password Text----------------
                  forgotPasswordWidget(),
                  SizedBox(height: 0.001.sh),
                  //----------------Enter Your Email Text----------------
                  enterYourEmailWidget(),
                  SizedBox(height: 0.05.sh),
                  //----------------Email Address Field----------------
                  emailAddressWidget(),
                  SizedBox(height: 0.06.sh),
                  //----------------Get Code Button----------------
                  getCodeButtonWidget(),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget forgotPasswordWidget() {
    return CustomText(
        maintext: AppStrings.FORGOT_PASSWORD_TEXT,
        color: AppColors.PURPLE_COLOR,
        fontWeight: FontWeight.bold,
        fontsize: 32.sp);
  }

  Widget enterYourEmailWidget() {
    return CustomText(maintext: AppStrings.ENTER_YOUR_EMAIL_TEXT);
  }

  Widget emailAddressWidget() {
    return CustomTextField(
        hint: AppStrings.EMAIL_FIELD_TEXT,
        prefxicon: AssetPaths.EMAIL2_ICON,
        prefixIconSize: 22.w,
        prefixRIghtPadding: 23.w,
        controller: forgotController.emailController,
        onsave: (value) {
          forgotController.email = value!;
        },
        validator: (value) {
          return FieldValidator.validateEmail(value!);
        });
  }

  Widget getCodeButtonWidget() {
    return CustomButton(
        text: AppStrings.GET_CODE_BUTTON_TEXT,
        onclick: () {
          forgotController.checkForgot();
        });
  }
}
