import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:royalty_nurse/custom_widget_folder/background.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_fancy_image.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_main_container.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_button.dart';
import 'package:royalty_nurse/custom_widget_folder/custom_text.dart';
import 'package:royalty_nurse/shift_module/Controller/find_shift_controller.dart';
import 'package:royalty_nurse/shift_module/Model/shift_model.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/app_color.dart';
import 'package:royalty_nurse/utils/app_padding.dart';
import 'package:royalty_nurse/utils/app_strings.dart';
import 'package:royalty_nurse/utils/assets_paths.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

class ShiftDetails extends StatefulWidget {
  const ShiftDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<ShiftDetails> createState() => _ShiftDetailsState();
}

class _ShiftDetailsState extends State<ShiftDetails> {
  FindShiftController findShiftController = Get.find();
  late dynamic args;
  late Jobs shiftDetails;
  final List<Marker> _markers = [];
  late CameraPosition map;

  @override
  void initState() {
    args = Get.arguments;
    shiftDetails = args[0];
    map = CameraPosition(
        target: LatLng(
          double.parse(shiftDetails.location!.longitude!),
          double.parse(shiftDetails.location!.latitude!),
        ),
        zoom: 14);

    _markers.add(Marker(
      markerId: const MarkerId('SomeId'),
      position: LatLng(
        double.parse(shiftDetails.location!.longitude!),
        double.parse(shiftDetails.location!.latitude!),
      ),
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      isLeading: AssetPaths.BACK_WHITE_ICON,
      onclickLead: () {
        Get.back();
      },
      isAction: AssetPaths.NOTIFICATION_ICON,
      onclickAction: () {
        Get.toNamed(Paths.NOTIFICATION_PAGE_SCREEN_ROUTE);
      },
      title: AppStrings.SHIFT_DETAILS_TEXT,
      child: CustomMainContainer(
        is_padding: false,
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: screeen_padding.screenPadding,
                  vertical: screeen_padding.screenPadding),
              child: Column(children: [
                //----------------Image Container----------------
                SizedBox(height: 0.01.sh),
                imageContainerWidget(),
                //----------------Hospital Name----------------
                SizedBox(height: 0.01.sh),
                hospitalNameWidget(),
                //----------------Job Title Text----------------
                SizedBox(height: 0.01.sh),
                bold_text(AppStrings.JOB_TITLE_TEXT),
                normal_text(shiftDetails.jobTitle),
                //----------------Job Timing Text----------------
                SizedBox(height: 0.01.sh),
                bold_text(AppStrings.TIMING_TEXT),
                normal_text(shiftDetails.jobTiming),
                //----------------Hourly Rate Text----------------
                SizedBox(height: 0.01.sh),
                bold_text(AppStrings.HOURLY_RATE_TEXT),
                normal_text("\$${shiftDetails.hourlyRate}/hour"),
                //----------------Job Address Text----------------
                SizedBox(height: 0.01.sh),
                bold_text(AppStrings.LOCATION_TEXT),
                normal_text(shiftDetails.jobLocation),
              ]),
            ),
            //----------------Google Map----------------
            googleMapWidget(),
            //----------------Apply Shift Button----------------
            applyButtonWidget(),
          ]),
        ),
      ),
    );
  }

  Widget bold_text(text) {
    return CustomText(
        maintext: text,
        color: AppColors.PURPLE_COLOR,
        fontWeight: FontWeight.bold);
  }

  Widget normal_text(text) {
    return CustomText(
        maintext: text, fontsize: 15.sp, fontWeight: FontWeight.w500);
  }

  Widget imageContainerWidget() {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10.0),
      //   color: AppColors.SEMI_GREY_COLOR,
      //   image: DecorationImage(
      //       image: NetworkImage(
      //           NetworkStrings.baseUrl + shiftDetails.hospitalImage!),
      //       fit: BoxFit.contain),
      // ),
      child: CustomFancyImage(
          image: NetworkStrings.baseUrl + shiftDetails.hospitalImage!),
    );
  }

  Widget hospitalNameWidget() {
    return CustomText(
        maintext: shiftDetails.hospitalName,
        is_alignLeft: false,
        color: AppColors.PURPLE_COLOR,
        fontWeight: FontWeight.bold);
  }

  Widget googleMapWidget() {
    return Container(
      color: Colors.black,
      width: 1.sw,
      height: 200.h,
      child: GoogleMap(
        initialCameraPosition: map,
        markers: Set<Marker>.of(_markers),
      ),
    );
  }

  Widget applyButtonWidget() {
    return args[1] == true
        ? Padding(
            padding: EdgeInsets.fromLTRB(screeen_padding.screenPadding, 20.h,
                screeen_padding.screenPadding, screeen_padding.screenPadding),
            child: CustomButton(
                text: AppStrings.APPLY_BUTTON_TEXT,
                onclick: () {
                  findShiftController.applyShift(context, shiftDetails.id);
                }),
          )
        : const SizedBox();
  }
}
