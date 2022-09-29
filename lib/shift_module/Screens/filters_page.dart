import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_main_container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/shift_module/Controller/find_shift_controller.dart';
import 'package:royalty_nurse/shift_module/widget/multi_select_dropdown.dart';
import 'package:royalty_nurse/shift_module/widget/slider_widget.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';

class FiltersPage extends StatefulWidget {
  FiltersPage({Key? key}) : super(key: key);

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  final FindShiftController findShiftController = Get.find();

  double minimumHourlyRate = 0;
  double maxmimumDistance = 0.0;
  double maximumApplicant = 0;
  double minimumshiftRange = 0;
  double maximumshiftRange = 3;
  List<dynamic> selectFacilityCity = [];
  List<dynamic> selectShift = [];
  List<dynamic> selectUnit = [];
  List<dynamic> selectSearch = [];

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      isLeading: AssetPaths.BACK_WHITE_ICON,
      onclickLead: () {
        Get.back();
      },
      actionText: AppStrings.RESET_TEXT,
      isAction: AssetPaths.BACK_WHITE_ICON,
      onclickAction: () {
        setState(() {
          minimumHourlyRate = 0;
          maxmimumDistance = 0.0;
        });
      },
      title: AppStrings.FILTERS_TEXT,
      child: CustomMainContainer(
        is_padding: false,
        child: Padding(
          padding: EdgeInsets.only(top: 25.0.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(children: [
              //----------------Minimum Hourly Rate Slider----------------
              minimumHurlyRateWidget(),
              SizedBox(height: 0.01.sh),
              //----------------Maximum Distance To Facility Slider----------------
              maxDistanceToFacilityWidget(),
              SizedBox(height: 0.01.sh),
              //----------------Facility City Dropdown----------------
              facilityCityWidget(),
              SizedBox(height: 0.01.sh),
              //---------------Shift Time Category Dropdown----------------
              shiftTimeCategoryWidget(),
              SizedBox(height: 0.01.sh),
              //----------------Shift Unit Dropdown----------------
              shiftUnitWidget(),
              SizedBox(height: 0.01.sh),
              //----------------Speciality Dropdown----------------
              specialityWidget(),
              SizedBox(height: 0.01.sh),
              //----------------Maximum Number Of Application Slider----------------
              maxNumberOfApplicationWidget(),
              SizedBox(height: 0.01.sh),
              //----------------Shift Duration Slider----------------
              shiftDurationWidget(),
              SizedBox(height: 0.01.sh),
              //----------------Show Shift Button----------------
              showShiftButtonWidget(),
              SizedBox(height: 0.01.sh),
            ]),
          ),
        ),
      ),
    );
  }

  Widget minimumHurlyRateWidget() {
    return sliderWidget(
        maintext: AppStrings.MINIMUM_HOURLY_RATE_TEXT,
        mintext: "\$${minimumHourlyRate.toInt()}",
        maxtext: "\$1000",
        minVal: 0,
        maxVal: 1000,
        selectedValue: minimumHourlyRate,
        divission: 100,
        onchange: (double valo) {
          setState(() {
            minimumHourlyRate = valo;
          });
        });
  }

  Widget maxDistanceToFacilityWidget() {
    return sliderWidget(
        maintext: AppStrings.MAX_DISTANCE_TO_FACILITY_TEXT,
        mintext: "${maxmimumDistance.toStringAsFixed(2)} Km",
        minVal: 0,
        maxVal: 100,
        selectedValue: maxmimumDistance,
        divission: 100,
        onchange: (double distance) {
          setState(() {
            maxmimumDistance = distance;
          });
        });
  }

  Widget facilityCityWidget() {
    return MultiSelectDropdown(
        maintext: AppStrings.FACILITY_CITY_TEXT,
        fieldText: AppStrings.SELECT_CITY_TEXT,
        chipItems: AppStrings.generateChipItems(
            chipItems: AppStrings.FACILITY_CITY_LIST),
        selectChipList: selectFacilityCity,
        onTap: (facilityValue) {
          setState(() {
            selectFacilityCity.remove(facilityValue);
          });
        },
        onConfirm: (facilityValues) {
          selectFacilityCity = facilityValues;
        });
  }

  Widget shiftTimeCategoryWidget() {
    return MultiSelectDropdown(
        maintext: AppStrings.SHIFT_TIME_CATEGORY_TEXT,
        fieldText: AppStrings.SELECT_CATEGORY_TEXT,
        chipItems:
            AppStrings.generateChipItems(chipItems: AppStrings.SHIFT_LIST),
        selectChipList: selectShift,
        onTap: (shiftValue) {
          setState(() {
            selectShift.remove(shiftValue);
          });
        },
        onConfirm: (shiftValue) {
          selectShift = shiftValue;
        });
  }

  Widget shiftUnitWidget() {
    return MultiSelectDropdown(
        maintext: AppStrings.SHIFT_UNINT_TEXT,
        fieldText: AppStrings.SELECT_UNITS_TEXT,
        chipItems:
            AppStrings.generateChipItems(chipItems: AppStrings.UNIT_LIST),
        selectChipList: selectUnit,
        onTap: (unitValue) {
          setState(() {
            selectUnit.remove(unitValue);
          });
        },
        onConfirm: (unitValue) {
          selectUnit = unitValue;
        });
  }

  Widget specialityWidget() {
    return MultiSelectDropdown(
        maintext: AppStrings.SPECIALITY_TEXT,
        fieldText: AppStrings.SEARCH_TEXT,
        chipItems:
            AppStrings.generateChipItems(chipItems: AppStrings.SEARCH_LIST),
        selectChipList: selectSearch,
        onTap: (searchValue) {
          setState(() {
            selectSearch.remove(searchValue);
          });
        },
        onConfirm: (searchValue) {
          selectSearch = searchValue;
        });
  }

  Widget maxNumberOfApplicationWidget() {
    return sliderWidget(
        maintext: AppStrings.MAX_NUMBER_OF_APPLICANTS_TEXT,
        mintext: "${maximumApplicant.toInt()} applicants",
        minVal: 0,
        maxVal: 100,
        selectedValue: maximumApplicant,
        divission: 100,
        onchange: (double lo) {
          setState(() {
            maximumApplicant = lo;
          });
        });
  }

  Widget shiftDurationWidget() {
    return sliderWidget(
        is_range: true,
        maintext: AppStrings.SHIFT_DURATION_TEXT,
        mintext:
            "${minimumshiftRange.toInt()} - ${maximumshiftRange.toInt()} hours",
        minVal: 0,
        maxVal: 6,
        startRange: minimumshiftRange,
        endRange: maximumshiftRange,
        divission: 6,
        onchangeRange: (RangeValues range) {
          setState(() {
            minimumshiftRange = range.start;
            maximumshiftRange = range.end;
          });
        });
  }

  Widget showShiftButtonWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomButton(
          text: AppStrings.SHOW_SHIFT_BUTTON_TEXT,
          onclick: () {
            findShiftController.filter(minimumHourlyRate, maxmimumDistance);
            Get.back();
            // Get.offAllNamed(Paths.BOTTOM_NAVIGATION_SCREEN_ROUTE);
          }),
    );
  }
}
