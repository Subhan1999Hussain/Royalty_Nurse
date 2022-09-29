import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_main_container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_tab.dart';
import 'package:royalty_nurse/payment_method_module/widget/add_bank_account.dart';
import 'package:royalty_nurse/payment_method_module/widget/recive_with_paypal.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      isLeading: AssetPaths.BACK_WHITE_ICON,
      onclickLead: () {
        Get.back();
      },
      title: AppStrings.PAYMENT_METHOD_TEXT,
      child: CustomMainContainer(
        child: const CustomTab(
            firstTXT: AppStrings.ADD_BANK_ACCOUNT_BUTTON_TEXT,
            secondTXT: AppStrings.RECIVE_WITH_PAYPAL_BUTTON_TEXT,
            firstWidget: AddBankAccount(),
            secondWidget: ReciveWithPayPal()),
      ),
    );
  }
}
