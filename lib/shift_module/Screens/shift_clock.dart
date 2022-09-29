import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/shift_module/Controller/clock_controller.dart';
import 'package:royalty_nurse/shift_module/widget/shift_clock_container.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_color.dart';

class ShiftClock extends StatelessWidget {
  final ClockController todayShiftController = Get.put(ClockController());
  ShiftClock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //----------------Today Shifts----------------
    return GetBuilder<ClockController>(
      builder: (controller) => controller.todayShift.isEmpty
          ? CustomText(
              maintext: "No Data",
              is_alignLeft: false,
              color: AppColors.GREY_COLOR)
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.todayShift.length,
              itemBuilder: (BuildContext context, int index) {
                return shiftClockContainer(
                    jobTitle: controller.todayShift[index].jobTitle!,
                    image: controller.todayShift[index].hospitalImage!,
                    hospitalName: controller.todayShift[index].hospitalName!,
                    rate: controller.todayShift[index].hourlyRate!.toString(),
                    time: controller.todayShift[index].jobTiming!,
                    hospitalId: controller.todayShift[index].id!,
                    onTap: () {
                      Get.toNamed(Paths.SHIFT_DETAILS_SCREEN_ROUTE,
                          arguments: [controller.todayShift[index], false]);
                    });
              }),
    );
  }
}
