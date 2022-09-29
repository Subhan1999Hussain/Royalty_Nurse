import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text_field.dart';
import 'package:royalty_nurse/shift_module/Controller/find_shift_controller.dart';
import 'package:royalty_nurse/shift_module/widget/find_screen_container.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class FindScreen extends StatelessWidget {
  final FindShiftController findShiftController =
      Get.put(FindShiftController());

  FindScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //----------------Search Field----------------
      searchFieldWidget(),
      //----------------All Shifts List Container----------------
      allShiftsListWidget(),
    ]);
  }

  Widget searchFieldWidget() {
    return CustomTextField(
        onchange: (value) => findShiftController.searchArea(value),
        prefxicon: AssetPaths.SEARCH_ICON,
        hint: AppStrings.FIND_SHIFT_SEARCH_FIELD_TEXT,
        sufixicon: AssetPaths.Filter_ICON,
        onclick: () {
          Get.toNamed(Paths.FILTERS_SCREEN_ROUTE);
        });
  }

  Widget allShiftsListWidget() {
    return Expanded(
      child: Obx(
        () => findShiftController.denied.value == true
            ? CustomText(
                maintext: "Please Location Allowed",
                is_alignLeft: false,
                color: AppColors.GREY_COLOR)
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: findShiftController.foundshift.value.length,
                itemBuilder: (context, index) {
                  return FindScreenContainer(
                      jobTitle:
                          findShiftController.foundshift.value[index].jobTitle!,
                      image: findShiftController
                          .foundshift.value[index].hospitalImage!,
                      hospitalName: findShiftController
                          .foundshift.value[index].hospitalName!,
                      location: findShiftController.distanceKm(
                          double.parse((findShiftController
                              .foundshift.value[index].location!.latitude)!),
                          double.parse((findShiftController
                              .foundshift.value[index].location!.longitude)!)),
                      onTap: () {
                        Get.toNamed(Paths.SHIFT_DETAILS_SCREEN_ROUTE,
                            arguments: [
                              findShiftController.foundshift.value[index],
                              true
                            ]);
                      });
                }),
      ),
    );
  }
}
