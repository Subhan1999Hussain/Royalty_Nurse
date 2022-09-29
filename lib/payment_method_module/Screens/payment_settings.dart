import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_main_container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text_field.dart';
import 'package:royalty_nurse/payment_method_module/Screens/add_new_card_alert_box.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class PaymentSettings extends StatelessWidget {
  const PaymentSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      isLeading: AssetPaths.BACK_WHITE_ICON,
      onclickLead: () {
        Get.back();
      },
      title: AppStrings.PAYMENT_SETTING_TEXT,
      child: CustomMainContainer(
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(height: 0.05.sh),
            //----------------Visa Text----------------
            visaTextWidget(),
            SizedBox(height: 0.02.sh),
            //----------------Master Field----------------
            masterWidget(),
            SizedBox(height: 0.02.sh),
            //----------------Strip Field----------------
            stripeWidget(),
            SizedBox(height: 0.2.sh),
            //----------------Add New Card Button----------------
            addNewCardWidget(context),
          ]),
        ),
      ),
    );
  }

  Widget visaTextWidget() {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
            onPressed: (context) {},
            foregroundColor: Colors.red,
            icon: Icons.delete),
      ]),
      child: CustomTextField(
          hint: AppStrings.VISA_TEXT,
          prefxicon: AssetPaths.VISA_IMAGE,
          prefixIconSize: 50.w,
          sufixicon: AssetPaths.CHECK_ICON),
    );
  }

  Widget masterWidget() {
    return CustomTextField(
        hint: AppStrings.MASTER_TEXT,
        prefxicon: AssetPaths.MASTER_IMAGE,
        prefixIconSize: 50.w,
        sufixicon: AssetPaths.CHECK_ICON);
  }

  Widget stripeWidget() {
    return CustomTextField(
        hint: AppStrings.STRIPE_TEXT,
        prefxicon: AssetPaths.STRIPE_IMAGE,
        prefixIconSize: 50.w,
        sufixicon: AssetPaths.CHECK_ICON);
  }

  Widget addNewCardWidget(BuildContext context) {
    return CustomButton(
        text: AppStrings.ADD_NEW_TEXT,
        onclick: () {
          showDialog(
              context: context,
              builder: (context) => const AddNewCardAlertBox());
        });
  }
}
