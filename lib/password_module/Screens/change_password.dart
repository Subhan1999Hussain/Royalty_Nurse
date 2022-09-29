import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_main_container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text_field.dart';
import 'package:royalty_nurse/password_module/Controller/change_password_controller.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';
import 'package:royalty_nurse/utils/validation.dart';

class ChangePassword extends StatelessWidget {
  final ChangePasswordController changePassController =
      Get.put(ChangePasswordController());

  ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      isLeading: AssetPaths.BACK_WHITE_ICON,
      onclickLead: () {
        Get.back();
      },
      title: AppStrings.CHANGE_PASSWORD_TEXT,
      child: CustomMainContainer(
        child: SingleChildScrollView(
          child: Obx(
            () => Form(
              key: changePassController.changepasswordFormkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(height: 0.05.sh),
                //----------------Old Password Field----------------
                oldPasswordWidget(),
                SizedBox(height: 0.02.sh),
                //----------------New Password Field----------------
                newPasswordWidget(),
                SizedBox(height: 0.02.sh),
                //----------------Confirm Password Field----------------
                confirmPasswordWidget(),
                SizedBox(height: 0.4.sh),
                //----------------Save Button----------------
                saveButtonWidget(),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget oldPasswordWidget() {
    return CustomTextField(
        hint: AppStrings.OLD_PASSWORD_FIELD_TEXT,
        prefxicon: AssetPaths.LOCK_ICON,
        prefixIconSize: 18.w,
        sufixicon: FieldValidator.isHideoldpassword.value
            ? AssetPaths.PASSWORD_SHOW
            : AssetPaths.PASSWORD_HIDE,
        obscureText: FieldValidator.isHideoldpassword.value,
        onclick: () {
          FieldValidator.oldpassword_hideIcon();
        },
        controller: changePassController.oldpasswordController,
        onsave: (value) {
          changePassController.oldpassword = value!;
        },
        validator: (value) {
          return FieldValidator.validatePassword(value!);
        });
  }

  Widget newPasswordWidget() {
    return CustomTextField(
        hint: AppStrings.NEW_PASSWORD_PASSWORD_FIELD_TEXT,
        prefxicon: AssetPaths.LOCK_ICON,
        prefixIconSize: 18.w,
        sufixicon: FieldValidator.isHidepassword.value
            ? AssetPaths.PASSWORD_SHOW
            : AssetPaths.PASSWORD_HIDE,
        obscureText: FieldValidator.isHidepassword.value,
        onclick: () {
          FieldValidator.password_hideIcon();
        },
        controller: changePassController.newpasswordController,
        onsave: (value) {
          changePassController.newpassword = value!;
        },
        validator: (value) {
          return FieldValidator.validatePassword(value!);
        });
  }

  Widget confirmPasswordWidget() {
    return CustomTextField(
        hint: AppStrings.CONFIRM_NEW_PASSWORD_FIELD_TEXT,
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
              changePassController.newpasswordController.text, value!);
        });
  }

  Widget saveButtonWidget() {
    return CustomButton(
        text: AppStrings.SAVE_BUTTON_TEXT,
        onclick: () {
          changePassController.checkChange();
        });
  }
}
