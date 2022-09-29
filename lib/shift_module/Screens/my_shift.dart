import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_tab.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/shift_module/Controller/upcoming_privous_shift_controller.dart';
import 'package:royalty_nurse/shift_module/widget/my_shift_container.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';

class MyShift extends StatelessWidget {
  final UpcomingPrivousShiftControllerController
      upcomingPreviousShiftController =
      Get.put(UpcomingPrivousShiftControllerController());

  MyShift({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTab(
      firstTXT: AppStrings.UPCOMING_SHIFT_BUTTON_TEXT,
      secondTXT: AppStrings.PREVIOUS_SHIFT_BUTTON_TEXT,
      //----------------Upcoming Shifts List----------------
      firstWidget: upcomingShift(),
      //----------------Previous Shifts List----------------
      secondWidget: previousShift(),
    );
  }

  Widget upcomingShift() {
    return GetBuilder<UpcomingPrivousShiftControllerController>(
      // init: UpcomingPrivousShiftControllerController(),
      builder: (controller) => controller.upcoming.isEmpty
          ? CustomText(
              maintext: "No Data",
              is_alignLeft: false,
              color: AppColors.GREY_COLOR)
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.upcoming.length,
              itemBuilder: (BuildContext context, int index) {
                return MyShiftContainer(
                    jobTitle: controller.upcoming[index].jobTitle!,
                    image: controller.upcoming[index].hospitalImage!,
                    hospitalName: controller.upcoming[index].hospitalName!,
                    rate: controller.upcoming[index].hourlyRate!.toString(),
                    date: controller
                            .dateConverter(controller.upcoming[index].date!) +
                        controller.upcoming[index].jobTiming!,
                    onTap: () {
                      Get.toNamed(Paths.SHIFT_DETAILS_SCREEN_ROUTE,
                          arguments: [controller.upcoming[index], false]);
                    });
              }),
    );
  }

  Widget previousShift() {
    return GetBuilder<UpcomingPrivousShiftControllerController>(
      init: UpcomingPrivousShiftControllerController(),
      builder: (controller) => controller.upcoming.isEmpty
          ? CustomText(maintext: "No Data", is_alignLeft: false,
                color: AppColors.GREY_COLOR)
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.previous.length,
              itemBuilder: (BuildContext context, int index) {
                return MyShiftContainer(
                    jobTitle: controller.previous[index].jobTitle!,
                    image: controller.previous[index].hospitalImage!,
                    hospitalName: controller.previous[index].hospitalName!,
                    rate: controller.previous[index].hourlyRate!.toString(),
                    date: controller
                            .dateConverter(controller.previous[index].date!) +
                        controller.previous[index].jobTiming!,
                    onTap: () {
                      Get.toNamed(Paths.SHIFT_DETAILS_SCREEN_ROUTE,
                          arguments: [controller.previous[index], false]);
                    });
              }),
    );
  }
}
