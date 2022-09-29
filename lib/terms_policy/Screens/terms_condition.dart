import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_main_container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/terms_policy/Controller/terms_privacy_controller.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

class TermsCondition extends StatefulWidget {
  const TermsCondition({Key? key}) : super(key: key);

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {
  final TermsPrivacyController termsPrivacyController =
      Get.put(TermsPrivacyController());

  @override
  void initState() {
    termsPrivacyController.GetTermsPrivacy(
        true, NetworkStrings.termsConditionEndpont);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      isLeading: AssetPaths.BACK_WHITE_ICON,
      onclickLead: () {
        Get.back();
      },
      title: AppStrings.TERMS_CONDITION_TEXT,
      child: CustomMainContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Obx(
              () => terms(termsPrivacyController.termsContent.value),
            ),
          ),
        ),
      ),
    );
  }

  Widget terms(text) {
    return CustomText(
        maintext: text, fontsize: 15.sp, color: AppColors.DARK_GREY_COLOR);
  }
}
