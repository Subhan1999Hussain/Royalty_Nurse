import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text_field.dart';
import 'package:royalty_nurse/payment_method_module/Screens/add_new_card_alert_box.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class AddBankAccount extends StatelessWidget {
  const AddBankAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: 0.05.sh),
        //----------------Edit Button----------------
        editButtonWidget(),
        SizedBox(height: 0.05.sh),
        //----------------Bank Name Field----------------
        CustomTextField(hint: AppStrings.BANK_NAME_FIELD_TEXT),
        SizedBox(height: 0.02.sh),
        //----------------Id Name Field----------------
        CustomTextField(hint: AppStrings.ID_NAME_TEXT),
        SizedBox(height: 0.02.sh),
        //----------------Account Field----------------
        CustomTextField(hint: AppStrings.ACCOUNT_FIELD_TEXT),
        SizedBox(height: 0.2.sh),
        //----------------Add Another Button----------------
        addAnotherButtonWidget(context),
        SizedBox(height: 10.h),
      ]),
    );
  }

  Widget editButtonWidget() {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 100.w,
        height: 35.h,
        child: CustomButton(
          btnimg: AssetPaths.EDIT_ICON,
          text: AppStrings.EDIT_BUTTON_TEXT,
          onclick: () {
            Get.toNamed(Paths.PAYMENT_SETTINGS_SCREEN_ROUTE);
          },
        ),
      ),
    );
  }

  Widget addAnotherButtonWidget(BuildContext context) {
    return CustomButton(
        text: AppStrings.ADD_ANOTHER_BUTTON_TEXT,
        onclick: () {
          showDialog(
              context: context,
              builder: (context) => const AddNewCardAlertBox());
        });
  }
}
