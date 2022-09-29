import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/auth_module/Controller/prelogin_controller.dart';
import 'package:royalty_nurse/auth_module/Controller/signup_controller.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/custom_widget_folder/snack_bar.dart';
import 'package:royalty_nurse/notification_module/widget/custom_radio_button.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';

class TermsPrivacyAlertBox extends StatefulWidget {
  final dynamic response;

  const TermsPrivacyAlertBox({Key? key, this.response}) : super(key: key);

  @override
  State<TermsPrivacyAlertBox> createState() => _TermsPrivacyAlertBoxState();
}

class _TermsPrivacyAlertBoxState extends State<TermsPrivacyAlertBox> {
  var termsRadio;
  var policyRadio;

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: GetBuilder<SignupController>(
            init: SignupController(),
            builder: (controller) =>
                Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(height: 20.h),
                  //----------------Agreement Text----------------
                  agreementWidget(),
                  //----------------I Have Read and Agreed To Text----------------
                  iHaveReadAndAgreedToWidget(),
                  SizedBox(height: 20.h),
                  //----------------Terms & Conditions Radio Button----------------
                  termsConditionRadioWidget(),
                  //----------------Privacy Policies Radio Button----------------
                  privacyPolicyRadioWidget(),
                  SizedBox(height: 15.h),
                  //----------------Accept & Reject Button----------------
                  twoButtonRowWidget(controller)
                ])));
  }

  Widget agreementWidget() {
    return CustomText(
        maintext: AppStrings.AGREEMENT_TEXT,
        color: AppColors.PURPLE_COLOR,
        is_alignLeft: false,
        fontsize: 27.sp,
        fontWeight: FontWeight.w800);
  }

  Widget iHaveReadAndAgreedToWidget() {
    return CustomText(
        maintext: AppStrings.I_HAVE_READ_AND_AGREED_TO_TEXT,
        fontsize: 15.sp,
        is_alignLeft: false);
  }

  Widget termsConditionRadioWidget() {
    return GestureDetector(
        onTap: () {
          Get.offNamed(Paths.TERMS_CONDITION_SCREEN_ROUTE);
        },
        child: CustomRadioButton(
            notificationText: AppStrings.TERMS_CONDITIONS_RADIO_BUTTON_TEXT,
            val: termsRadio,
            onchanged: (value) {
              setState(() {
                termsRadio = value;
              });
            }));
  }

  Widget privacyPolicyRadioWidget() {
    return GestureDetector(
        onTap: () {
          Get.offNamed(Paths.PRIVACY_POLICY_SCREEN_ROUTE);
        },
        child: CustomRadioButton(
            notificationText: AppStrings.PRIVACY_POLICY_RADIO_BUTTON_TEXT,
            val: policyRadio,
            onchanged: (value) {
              setState(() {
                policyRadio = value;
              });
            }));
  }

  Widget twoButtonRowWidget(controller) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      //----------------Reject Button----------------
      rejectButtonWidget(),
      //----------------Accept Button----------------
      acceptButtonWidget(controller),
    ]);
  }

  Widget rejectButtonWidget() {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(30)),
                  color: AppColors.SEMI_GREY_COLOR),
              height: 45.h,
              child: CustomText(
                  maintext: AppStrings.REJECT_BUTTON_TEXT, is_alignLeft: false),
            )));
  }

  Widget acceptButtonWidget(controller) {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              if (termsRadio != 0 && policyRadio != 0) {
                SnackBar_Message(
                    "Please accpet terms & Conditions and Privacy policy");
              } else if (termsRadio != 0) {
                SnackBar_Message("Please accpet Terms & Conditions");
              } else if (policyRadio != 0) {
                SnackBar_Message("Please accpet Privacy policy");
              } else {
                if (widget.response == "signup") {
                  controller.checkSignup();
                } else if (widget.response == "google") {
                  PreLoginController.googleSignUp("Google");
                }
              }
            },
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30)),
                    gradient: LinearGradient(colors: [
                      AppColors.BUTTON_GRADIENT1_COLOR,
                      AppColors.BUTTON_GRADIENT2_COLOR,
                      AppColors.BUTTON_GRADIENT3_COLOR,
                      AppColors.BUTTON_GRADIENT4_COLOR
                    ])),
                height: 45.h,
                child: CustomText(
                    maintext: AppStrings.ACCEPT_BUTTON_TEXT,
                    is_alignLeft: false))));
  }
}
