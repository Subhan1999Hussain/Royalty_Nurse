import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:royalty_nurse/Services/api_services.dart';
import 'package:royalty_nurse/custom_widget_folder/loader.dart';
import 'package:royalty_nurse/custom_widget_folder/snack_bar.dart';
import 'package:royalty_nurse/timesheet_module/Model/timesheet_model.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

class TimeSheetController extends GetxController {
  List<Sheet> sheet = <Sheet>[];
  String formattedtime = "";

  @override
  void onInit() {
    timesheet(DateTime.now());
    super.onInit();
  }

  //----------------------------------Time Sheet Api---------------------------------
  Future<TimeSheetModel?> timesheet(time) async {
    formattedtime = DateFormat("yyyy-MM-dd").format(time).toString();
    try {
      var response = await ApiService.get(
              NetworkStrings.timeSheetEndpont + formattedtime, true)
          .timeout(
        const Duration(seconds: 20),
      )
      ;

      var values = jsonDecode(response!.body);

      var obj = TimeSheetModel.fromJson(values);
      if (response.statusCode == 200) {
        sheet = obj.sheet!;
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
