import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/Services/api_services.dart';
import 'package:royalty_nurse/custom_widget_folder/loader.dart';
import 'package:royalty_nurse/custom_widget_folder/snack_bar.dart';
import 'package:royalty_nurse/shift_module/Model/shift_model.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

class UpcomingPrivousShiftControllerController extends GetxController {
  List<Jobs> upcoming = <Jobs>[];
  List<Jobs> previous = <Jobs>[];

  @override
  void onInit() async {
    super.onInit();
    // shift(true, NetworkStrings.upComingShiftEndpont);
    // shift(false, NetworkStrings.previousShftEndpont);
  }

  //------------------------date Format Convertor-----------------------
  String dateConverter(date) {
    DateTime current = DateTime.parse(date);
    String formattedDate = DateFormat('EEEE ,MMM dd ,').format(current);
    return formattedDate;
  }

  //------------------UpComing And Previous Shift Api---------------------------------
  Future<ShiftModel?> shift(bool x, endpoint) async {
    try {
      var response = await ApiService.get(endpoint, true)
      .timeout(
        const Duration(seconds: 20),
      )
      ;

      var values = jsonDecode(response!.body);
      var obj = ShiftModel.fromJson(values);
      if (response.statusCode == 200) {
        //------------For Upcoming-----------------------
        if (x) {
          upcoming = obj.jobs!;
        }
        //------------For Previous-----------------------
        else {
          previous = obj.jobs!;
        }

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
}
