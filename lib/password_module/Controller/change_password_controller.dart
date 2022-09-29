import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/Services/api_services.dart';
import 'package:royalty_nurse/custom_widget_folder/loader.dart';
import 'package:royalty_nurse/custom_widget_folder/snack_bar.dart';
import 'package:royalty_nurse/password_module/Model/password_model.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

class ChangePasswordController extends GetxController {
  final GlobalKey<FormState> changepasswordFormkey = GlobalKey<FormState>();

  late TextEditingController oldpasswordController, newpasswordController;

  var oldpassword = '';
  var newpassword = '';

  @override
  void onInit() {
    super.onInit();
    oldpasswordController = TextEditingController();
    newpasswordController = TextEditingController();
  }

  @override
  void onClose() {
    oldpasswordController.dispose();
    newpasswordController.dispose();
  }

  //---------------------------Change Password Api------------------------------
  Future<void> checkChange() async {
    final isValid = changepasswordFormkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    changepasswordFormkey.currentState!.save();
    final Map<String, dynamic> data = <String, dynamic>{};

    data['user_password'] = oldpassword;
    data['user_new_password'] = newpassword;
    try {
      var response = await ApiService.post(
              NetworkStrings.updatepasswordEndpoint, data, true)
          .timeout(
        const Duration(seconds: 20),
      )
      ;

      var values = jsonDecode(response!.body);

      if (response.statusCode == 200) {
        var obj = PasswordModel.fromJson(values);
        SnackBar_Message(obj.msg);
        //---------------------------Go to Main Menu---------------------------
        Get.offNamed(Paths.BOTTOM_NAVIGATION_SCREEN_ROUTE);
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
}
