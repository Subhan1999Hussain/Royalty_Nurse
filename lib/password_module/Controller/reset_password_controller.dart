import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/Services/api_services.dart';
import 'package:royalty_nurse/custom_widget_folder/loader.dart';
import 'package:royalty_nurse/custom_widget_folder/snack_bar.dart';
import 'package:royalty_nurse/password_module/Model/password_model.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

class ResetPasswordController extends GetxController {
  final GlobalKey<FormState> resetpasswordFormkey = GlobalKey<FormState>();

  late TextEditingController passwordController;

  var password = '';

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    passwordController.dispose();
  }

  //---------------------------Forget Password Api------------------------------
  Future<void> checkReset() async {
    final isValid = resetpasswordFormkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    dynamic args = Get.arguments;
    resetpasswordFormkey.currentState!.save();
    final Map<String, dynamic> data = <String, dynamic>{};

    data['user_id'] = args;
    data['user_password'] = password;
    try {
      var response = await ApiService.post(
              NetworkStrings.resetpasswordEndpoint, data, false)
          .timeout(
        const Duration(seconds: 20),
      )
      ;
      var values = jsonDecode(response!.body);

      if (response.statusCode == 200) {
        var obj = PasswordModel.fromJson(values);
        SnackBar_Message(obj.msg);
        //----------------------------Pre Login-----------------------------------
        Get.offAllNamed(Paths.PRE_LOGIN_SCREEN_ROUTE);
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
