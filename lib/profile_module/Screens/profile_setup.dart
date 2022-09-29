import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_dropdown_field.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_main_container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text_field.dart';
import 'package:royalty_nurse/profile_module/widget_folder/profile_stack.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';
import 'package:royalty_nurse/utils/validation.dart';
import '../Controller/profile_setup_controller.dart';

class ProfileSetup extends StatelessWidget {
  final ProfileSetupControler prfileSetupController =
      Get.put(ProfileSetupControler());

  ProfileSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      isLeading: AssetPaths.BACK_WHITE_ICON,
      onclickLead: () {
        Get.back();
      },
      title: AppStrings.PROFILE_SETUP_TEXT,
      child: CustomMainContainer(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: prfileSetupController.profileSetupFormkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(children: [
              //----------------Profile Pic----------------
              SizedBox(height: 0.03.h),
              profilePicWidget(),
              //----------------Full Name Field----------------
              SizedBox(height: 0.03.sh),
              fullNamWidget(),
              //----------------License Number Field----------------
              SizedBox(height: 0.02.sh),
              licenseNumberWidget(),
              //----------------SSN Field----------------
              SizedBox(height: 0.02.sh),
              ssnFieldWidget(),

              //----------------Position DropDown----------------
              SizedBox(height: 0.02.sh),
              positionDorpDownWidget(),

              //----------------Save Changes Button----------------
              SizedBox(height: 0.02.sh),
              saveChangesWidget(),
            ]),
          ),
        ),
      ),
    );
  }

  Widget profilePicWidget() {
    return Obx(
      () => ProfileStack(
          profilePicPathSet: prfileSetupController.isprofilepicpathset,
          profilePicPath: prfileSetupController.profilepicpath.value,
          controller: prfileSetupController),
    );
  }

  Widget fullNamWidget() {
    return CustomTextField(
        hint: AppStrings.FULL_NAME_FIELD_TEXT,
        controller: prfileSetupController.fullnameController,
        onsave: (value) {
          prfileSetupController.fullname = value!;
        },
        validator: (value) {
          return FieldValidator.validateName(value!);
        });
  }

  Widget licenseNumberWidget() {
    return CustomTextField(
        hint: AppStrings.LICENSE_NUMBER_FIELD_TEXT,
        controller: prfileSetupController.licensenumberController,
        onsave: (value) {
          prfileSetupController.licensenumber = value!;
        },
        validator: (value) {
          return FieldValidator.valiadteEmpty(value!);
        });
  }

  Widget ssnFieldWidget() {
    return CustomTextField(
        hint: AppStrings.SSN_FIELD_TEXT,
        controller: prfileSetupController.ssnController,
        onsave: (value) {
          prfileSetupController.ssn = value!;
        },
        validator: (value) {
          return FieldValidator.valiadteEmpty(value!);
        });
  }

  Widget positionDorpDownWidget() {
    return CustomDropdownField(
      Itemsss: AppStrings.ASD,
      onchange: (newItem) {
        prfileSetupController.option.value = newItem.toString();
      },
    );
  }

  Widget saveChangesWidget() {
    return CustomButton(
        text: AppStrings.PROCEED_BUTTON_TEXT,
        onclick: () {
          prfileSetupController.setupProfile();
        });
  }
}
