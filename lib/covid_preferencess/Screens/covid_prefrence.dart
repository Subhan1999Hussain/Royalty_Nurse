import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/covid_preferencess/widget/custom_single_preference.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_main_container.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class CovidPrefrences extends StatelessWidget {
  const CovidPrefrences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      isLeading: AssetPaths.BACK_WHITE_ICON,
      onclickLead: () {
        Get.back();
      },
      title: AppStrings.COVID_PREFERENCES_OPTION_TEXT,
      child: CustomMainContainer(
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            //---------------------Covid Preferences 1----------------------
            SizedBox(height: 0.01.sh),
            covidPreferences1Widget(),
            SizedBox(height: 0.01.sh),
            const Divider(color: AppColors.BLACK_COLOR),
            //---------------------Covid Preferences 2----------------------
            SizedBox(height: 0.01.sh),
            covidPreferences2Widget(),
            SizedBox(height: 0.01.sh),
            const Divider(color: AppColors.BLACK_COLOR),
            //---------------------Covid Preferences 3----------------------
            SizedBox(height: 0.01.sh),
            covidPreferences3Widget(),
          ]),
        ),
      ),
    );
  }

  Widget covidPreferences1Widget() {
    return const CustomSinglePreference(
        firstText: AppStrings.COVID_PREFERENCES_1);
  }

  Widget covidPreferences2Widget() {
    return const CustomSinglePreference(
        firstText: AppStrings.COVID_PREFERENCES_2);
  }

  Widget covidPreferences3Widget() {
    return const CustomSinglePreference(
        firstText: AppStrings.COVID_PREFERENCES_3);
  }
}
