import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/Services/api_services.dart';
import 'package:royalty_nurse/custom_widget_folder/loader.dart';
import 'package:royalty_nurse/custom_widget_folder/snack_bar.dart';
import 'package:royalty_nurse/shift_module/Model/shift_model.dart';
import 'package:royalty_nurse/shift_module/Screens/application_received_alert_box.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

class FindShiftController extends GetxController {
  var search = TextEditingController();
  List<Jobs> allShifts = <Jobs>[];
  Rx<List<Jobs>> foundshift = Rx<List<Jobs>>([]);
  String location = 'No km';
  double distanceInMeters = 0;
  RxBool denied = false.obs;
  late Position position;

  @override
  void onInit() async {
    super.onInit();

    findShift();
  }

  //------------------Searching---------------------
  void searchArea(String search) {
    List<Jobs> results = [];
    if (search.isEmpty) {
      results = allShifts;
    } else {
      results = foundshift.value
          .where((element) => element.hospitalName
              .toString()
              .toLowerCase()
              .contains(search.toLowerCase()))
          .toList();
    }
    foundshift.value = results;
  }

  //------------------Distance in Km---------------------
  double distanceKm(double la, double lo) {
    showLoading();
    distanceInMeters = Geolocator.distanceBetween(
        position.latitude, position.longitude, lo, la);
    stopLoading();

    return (distanceInMeters / 1000);
  }

  //------------------Filter---------------------
  void filter(double minimumHourlyRate, double maxmimumDistance) async {
    List<Jobs> filter = <Jobs>[];
    filter = allShifts
        .where((element) =>
            element.hourlyRate! > minimumHourlyRate &&
            distanceKm(double.parse(element.location!.latitude!),
                    double.parse(element.location!.longitude!)) <
                maxmimumDistance)
        .toList();
    foundshift.value = filter;
  }

  //---------------------------All Shifts Api---------------------------------
  Future<ShiftModel?> findShift() async {
    try {
      position = await _getGeoLocationPosition();

      var response =
          await ApiService.get(NetworkStrings.findshiftEndpont, false).timeout(
        const Duration(seconds: 20),
      );
      var values = jsonDecode(response!.body);
      var obj = ShiftModel.fromJson(values);
      if (response.statusCode == 200) {
        denied.value = false;
        allShifts = obj.jobs!;
        foundshift.value = obj.jobs!;
      } else {
        SnackBar_Message(obj.msg.toString());
      }
    } on TimeoutException catch (_) {
      stopLoading();
      SnackBar_Message("Server Problem");
    } catch (_) {
      stopLoading();
      print(_);
      SnackBar_Message("App is not working correct contact Admin");
    }
    return null;
  }

  //----------------------------------Apply a Shift Api---------------------------------
  Future<void> applyShift(context, id) async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hospital_id'] = id;
    try {
      var response =
          await ApiService.post(NetworkStrings.applyShiftEndpont, data, true)
              .timeout(
        const Duration(seconds: 20),
      );
      var values = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        SnackBar_Message(values['msg']);

        //-------------------Go to Application Receive Alert Box-----------------------
        showDialog(
            context: context,
            builder: (context) => const ApplicationReceivedAlertBox());
        Get.back();
      } else {
        SnackBar_Message(values['msg']);
      }
    } on TimeoutException catch (_) {
      stopLoading();
      SnackBar_Message("Server Problem");
    } catch (_) {
      stopLoading();
      SnackBar_Message("App is not working correct contact Admin");
    }
  }

  //--------GeoLocator For Current Position and Location Permission-----------------------------
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      denied.value = true;

      await Geolocator.requestPermission();
    }

    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        denied.value = true;

        permission = await Geolocator.requestPermission();
      }
    }
    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      denied.value = true;
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
