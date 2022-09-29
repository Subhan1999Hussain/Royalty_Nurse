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

class PrivacyPolicy extends StatefulWidget {
  PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final TermsPrivacyController termsPrivacyController =
      Get.put(TermsPrivacyController());

  @override
  void initState() {
    termsPrivacyController.GetTermsPrivacy(
        false, NetworkStrings.privacyPolicyEndpont);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      isLeading: AssetPaths.BACK_WHITE_ICON,
      onclickLead: () {
        Get.back();
      },
      title: AppStrings.PRIVACY_POLICY_TEXT,
      child: CustomMainContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Obx(
              () => privacy(termsPrivacyController.privacyContent.value),
            ),
          ),
        ),
      ),
    );
  }

  Widget privacy(text) {
    return CustomText(
        maintext: text, fontsize: 15.sp, color: AppColors.DARK_GREY_COLOR);
  }
}
