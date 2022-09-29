import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_dropdown_field.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_main_container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text_field.dart';
import 'package:royalty_nurse/profile_module/Controller/edit_profile_controller.dart';
import 'package:royalty_nurse/profile_module/widget_folder/profile_stack.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';
import 'package:royalty_nurse/utils/validation.dart';

final box = GetStorage();

class EditProfile extends StatelessWidget {
  final EditProfileControler editPrfileController =
      Get.put(EditProfileControler());
  EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    editPrfileController.option.value = box.read("position");
    return BackgroundImage(
      isLeading: AssetPaths.BACK_WHITE_ICON,
      onclickLead: () {
        Get.back();
      },
      title: AppStrings.EDIT_PROFILE_TEXT,
      child: CustomMainContainer(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: editPrfileController.editProfileFormkey,
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
          profilePicPathSet: editPrfileController.isprofilepicpathset,
          profilePicPath: editPrfileController.profilepicpath.value,
          controller: editPrfileController),
    );
  }

  Widget fullNamWidget() {
    return CustomTextField(
        hint: AppStrings.FULL_NAME_FIELD_TEXT,
        controller: editPrfileController.fullnameController
          ..text = box.read("full_name"),
        onsave: (value) {
          editPrfileController.fullname = value!;
        },
        validator: (value) {
          return FieldValidator.validateName(value!);
        });
  }

  Widget licenseNumberWidget() {
    return CustomTextField(
        hint: AppStrings.LICENSE_NUMBER_FIELD_TEXT,
        controller: editPrfileController.licensenumberController
          ..text = box.read("license_num"),
        onsave: (value) {
          editPrfileController.licensenumber = value!;
        },
        validator: (value) {
          return FieldValidator.valiadteEmpty(value!);
        });
  }

  Widget ssnFieldWidget() {
    return CustomTextField(
        hint: AppStrings.SSN_FIELD_TEXT,
        controller: editPrfileController.ssnController..text = box.read("ssn"),
        onsave: (value) {
          editPrfileController.ssn = value!;
        },
        validator: (value) {
          return FieldValidator.valiadteEmpty(value!);
        });
  }

  Widget positionDorpDownWidget() {
    return CustomDropdownField(
        value: editPrfileController.option.value,
        Itemsss: AppStrings.ASD,
        onchange: (newItem) {
          editPrfileController.option.value = newItem.toString();
        });
  }

  Widget saveChangesWidget() {
    return CustomButton(
        text: AppStrings.SAVE_CHANGES_BUTTON_TEXT,
        onclick: () {
          editPrfileController.editProfile();
        });
  }
}
