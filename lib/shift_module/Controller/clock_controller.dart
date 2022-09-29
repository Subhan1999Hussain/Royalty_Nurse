import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/Services/api_services.dart';
import 'package:royalty_nurse/custom_widget_folder/loader.dart';
import 'package:royalty_nurse/custom_widget_folder/snack_bar.dart';
import 'package:royalty_nurse/shift_module/Model/shift_model.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

final box = GetStorage();

class ClockController extends GetxController {
  DateTime dateTime = DateTime.now();
  String formattedtime = "";
  List<Map<String, String>> clock = <Map<String, String>>[];
  List<Jobs> todayShift = <Jobs>[];

  @override
  void onInit() async {
    super.onInit();
    // todayshift();
  }

  //----------------------------------Today Shift Api---------------------------------
  Future<ShiftModel?> todayshift() async {
    try {
      var response =
          await ApiService.get(NetworkStrings.todayShftEndpont, true)
          .timeout(
        const Duration(seconds: 20),
      )
      ;


      var values = jsonDecode(response!.body);
      var obj = ShiftModel.fromJson(values);
      if (response.statusCode == 200) {
        todayShift = obj.jobs!;

        update();
      } else {
        SnackBar_Message(obj.msg.toString());
      }
    } on TimeoutException catch (_) {
      stopLoading();
      SnackBar_Message("Server Problem");
    } catch (_) {
      stopLoading();
      SnackBar_Message("App is not working correct contact Admin");
    }
    return null;
  }

  //----------------------------------Check In Check Out Api---------------------------------
  Future<void> inOut(id, bool checkIn) async {
    showLoading();
    Get.back();

    formattedtime = DateFormat("hh : mm  a").format(DateTime.now()).toString();
    var token = box.read('token');

    //---------------------Check In-------------------------
    if (checkIn) {
      Map<String, String> time = <String, String>{
        "clockType": "Clock In",
        "clockTime": formattedtime,
      };
      clock.add(time);
    }
    //---------------------Check Out-------------------------
    else {
      Map<String, String> time = <String, String>{
        "clockType": "Clock Out",
        "clockTime": formattedtime
      };
      clock.add(time);
    }

    try {
      var response = await http.post(
          Uri.parse(NetworkStrings.baseUrl +
              NetworkStrings.api +
              NetworkStrings.inOutEndpont),
          body: jsonEncode({"hospital_id": id, "clock": clock}),
          headers: {
            'Accept': 'application/json',
            "Authorization": 'Bearer $token',
            "Content-Type": "application/json"
          })
          .timeout(
        const Duration(seconds: 20),
      )
      ;
      var values = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (checkIn) {
          SnackBar_Message("Check In Successfuly");
        } else {
          SnackBar_Message("Check Out Successfuly");
        }
        stopLoading();
      } else {
        stopLoading();
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
}
