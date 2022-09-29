import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_main_container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/timesheet_module/Controller/time_sheet_controller.dart';
import 'package:royalty_nurse/timesheet_module/widget/time_line.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class TimeSheet extends StatelessWidget {
  TimeSheet({Key? key}) : super(key: key);

  final timeSheetController = Get.put(TimeSheetController());

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      isLeading: AssetPaths.BACK_WHITE_ICON,
      onclickLead: () {
        Get.back();
      },
      title: AppStrings.MY_TIMESHEETS_OPTION_TEXT,
      child: CustomMainContainer(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 0.01.sh),
          //----------------Date Picker Slider----------------
          datePickerWidget(),
          SizedBox(height: 10.h),
          //----------------Time Sheet List----------------
          timeSheetListWidget(),
          // //----------------Download Time Sheet Button----------------
          // downloadTimeSheetWidget(),
          // SizedBox(height: 10.h),
        ]),
      ),
    );
  }

  Widget datePickerWidget() {
    return DatePicker(
        // DateTime.now(),
        DateTime.now().subtract(const Duration(days: 5)),
        initialSelectedDate: DateTime.now(),
        deactivatedColor: AppColors.TIME_GREY_COLOR,
        selectionColor: AppColors.BOTTOM_GRADIENT4_COLOR,
        selectedTextColor: AppColors.WHITE_COLOR,
        monthTextStyle:
            TextStyle(color: AppColors.TIME_GREY_COLOR, fontSize: 11.0.sp),
        dayTextStyle:
            TextStyle(color: AppColors.TIME_GREY_COLOR, fontSize: 11.0.sp),
        dateTextStyle:
            TextStyle(color: AppColors.TIME_GREY_COLOR, fontSize: 20.0.sp),
        onDateChange: (date) {
      timeSheetController.timesheet(date);
    });
  }

  Widget timeSheetListWidget() {
    return GetBuilder<TimeSheetController>(
      builder: (controller) => Expanded(
        child: controller.sheet.isEmpty
            ? CustomText(
                maintext: "No Data",
                is_alignLeft: false,
                color: AppColors.GREY_COLOR)
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.sheet.length,
                itemBuilder: (BuildContext context, int index) {
                  return timeLine(
                      jobTitle: controller.sheet[index].hospitalId!.jobTitle!,
                      image: controller.sheet[index].hospitalId!.hospitalImage!,
                      hospitalName:
                          controller.sheet[index].hospitalId!.hospitalName!,
                      rate: controller.sheet[index].hospitalId!.hourlyRate!
                          .toString(),
                      time: controller.sheet[index].clock![0].toString(),
                      clock: controller.sheet[index].clock!,
                      type: " Type");
                }),
      ),
    );
  }

  Widget downloadTimeSheetWidget() {
    return CustomButton(text: AppStrings.DOWNLOAD_TIME_SHEET, onclick: () {});
  }
}
