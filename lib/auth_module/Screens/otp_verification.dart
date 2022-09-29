import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:royalty_nurse/auth_module/Controller/otp_verification_controller.dart';
import 'package:royalty_nurse/custom_widget_folder/app_logo.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_bottom_container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_padding.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';
import 'package:royalty_nurse/utils/validation.dart';

class OTPVerification extends StatelessWidget {
  final OtpVerificationController otpController =
      Get.put(OtpVerificationController());

  OTPVerification({Key? key}) : super(key: key);

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
          child: Column(
            children: [
              //----------------App Logo----------------
              AppLogo(),
              SizedBox(height: 0.07.sh),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: otpController.otpFormkey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        //----------------OTP Verification Text----------------
                        otpVerificationWidget(),
                        SizedBox(height: 0.001.sh),
                        //----------------Enter Your Code Text----------------
                        enterYourCodeWidget(),
                        SizedBox(height: 0.02.sh),
                        //----------------Pin Code Field----------------
                        pinCodeWidget(context),
                        SizedBox(height: 0.01.sh),
                        //----------------Verify Button----------------
                        verifyButtonWidget(),
                        SizedBox(height: 0.07.sh),
                        //----------------Timmer----------------
                        timmerWidget(),
                        //----------------DiDnt Receive Code----------------
                        didntReceiveCodeWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget otpVerificationWidget() {
    return CustomText(
        maintext: AppStrings.OTP_VERIFICATION_TEXT,
        color: AppColors.PURPLE_COLOR,
        fontWeight: FontWeight.bold,
        fontsize: 32.sp);
  }

  Widget enterYourCodeWidget() {
    return CustomText(maintext: AppStrings.ENTER_YOUR_CODE_TEXT);
  }

  Widget pinCodeWidget(BuildContext context) {
    return PinCodeTextField(
        appContext: context,
        length: 6,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.circle,
            fieldHeight: .13.sh,
            fieldWidth: .13.sw,
            activeFillColor: AppColors.WHITE_COLOR,
            inactiveFillColor: AppColors.WHITE_COLOR,
            selectedFillColor: AppColors.WHITE_COLOR,
            activeColor: AppColors.WHITE_COLOR,
            inactiveColor: AppColors.WHITE_COLOR,
            selectedColor: AppColors.WHITE_COLOR),
        showCursor: false,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        keyboardType: TextInputType.number,
        boxShadows: [
          BoxShadow(
              color: AppColors.PURPLE_COLOR.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 5,
              offset: Offset(0, 2))
        ],
        // onCompleted: (v) {
        //   debugPrint("Completed");
        // },
        onChanged: (value) {
          debugPrint(value);
        },
        controller: otpController.pinController,
        onSaved: (value) {
          otpController.pin = value!;
        },
        validator: (value) {
          return FieldValidator.validatePin(value!);
        });
  }

  Widget verifyButtonWidget() {
    return CustomButton(
        text: AppStrings.VERIFY_BUTTON_TEXT,
        onclick: () {
          otpController.checkOtp();
        });
  }

  Widget timmerWidget() {
    return GetBuilder<OtpVerificationController>(
        builder: (builder) => CustomText(
            maintext: '00 :${otpController.count} ',
            fontsize: 25.0,
            is_alignLeft: false,
            color: AppColors.BLACK_COLOR));
  }

  Widget didntReceiveCodeWidget() {
    return GetBuilder<OtpVerificationController>(
        builder: (builder) => CustomBottomContainer(
            starttext: AppStrings.DIDNT_RECEIVE_CODE_TEXT,
            endtext: AppStrings.RESEND_TEXT,
            onclick: () {
              if (otpController.count == 0) {
                otpController.reset();
              }
            }));
  }
}
