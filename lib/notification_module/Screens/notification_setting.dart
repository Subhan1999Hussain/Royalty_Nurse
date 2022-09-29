import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_main_container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/notification_module/widget/custom_radio_button.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_padding.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class NotificationSetting extends StatelessWidget {
  const NotificationSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      isLeading: AssetPaths.BACK_WHITE_ICON,
      onclickLead: () {
        Get.back();
      },
      title: AppStrings.NOTIFICATION_SETTINGS_OPTION_TEXT,
      child: CustomMainContainer(
        is_padding: false,
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(height: 0.01.sh),
            //----------------In App Notification Text----------------
            notificationText(AppStrings.IN_APP_NOTIFICATION_TEXT),
            //----------------Application Acceptance and Rejection----------------
            CustomRadioButton(
                notificationText:
                    AppStrings.APPICATION_ACCEPTANCE_REJECTION_RADIO_TEXT),
            //----------------Emergency Shift Notification----------------
            CustomRadioButton(
                notificationText:
                    AppStrings.EMERGENCY_SHIFT_NOTIFICATON_RADIO_TEXT),
            //----------------Shift Reminders----------------
            CustomRadioButton(
                notificationText: AppStrings.SHIFT_REMINDERS_RADIO_TEXT),
            //----------------Payment Received----------------
            CustomRadioButton(
                notificationText: AppStrings.PAYMENT_RECEIVED_RADIO_TEXT),
            //----------------Push Notification Text----------------
            notificationText(AppStrings.PUSH_NOTIFICATION_TEXT),
            //----------------Application Acceptance and Rejection----------------
            CustomRadioButton(
                notificationText:
                    AppStrings.APPICATION_ACCEPTANCE_REJECTION_RADIO_TEXT),
            //----------------Shift Notification----------------
            CustomRadioButton(
                notificationText:
                    AppStrings.EMERGENCY_SHIFT_NOTIFICATON_RADIO_TEXT),
            //----------------Login Button----------------
            CustomRadioButton(
                notificationText: AppStrings.SHIFT_REMINDERS_RADIO_TEXT),
            //----------------Payment Received----------------
            CustomRadioButton(
                notificationText: AppStrings.PAYMENT_RECEIVED_RADIO_TEXT),
          ]),
        ),
      ),
    );
  }

  Widget notificationText(text) {
    return Padding(
      padding: EdgeInsets.only(
          left: screeen_padding.screenPadding,
          top: 20.h,
          right: screeen_padding.screenPadding),
      child: CustomText(maintext: text, color: AppColors.PURPLE_COLOR),
    );
  }
}
