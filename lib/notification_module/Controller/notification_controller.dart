import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/Services/api_services.dart';
import 'package:royalty_nurse/custom_widget_folder/loader.dart';
import 'package:royalty_nurse/custom_widget_folder/snack_bar.dart';
import 'package:royalty_nurse/notification_module/Model/notification_model.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

class NotificationController extends GetxController {

  List<Notification> notify = <Notification>[];

  @override
  void onInit() async {
    super.onInit();
    getNotify();
  }

  //----------------------------------Notification Api---------------------------------
  Future<NotificationModel?> getNotify() async {
    try {
      var response =
          await ApiService.get(NetworkStrings.notificationEndpont, true)
              .timeout(
        const Duration(seconds: 20),
      )
      ;

      var values = jsonDecode(response!.body);
      var obj = NotificationModel.fromJson(values);
      if (response.statusCode == 200) {
        notify = obj.notification!;
        // SnackBar_Message(obj.msg.toString());
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
