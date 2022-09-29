import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/Services/api_services.dart';
import 'package:royalty_nurse/custom_widget_folder/loader.dart';
import 'package:royalty_nurse/custom_widget_folder/snack_bar.dart';
import 'package:royalty_nurse/custom_widget_folder/toast.dart';
import 'package:royalty_nurse/password_module/Model/forgot_model.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

dynamic user_id;

class ForgotPasswordController extends GetxController {
  final GlobalKey<FormState> forgotFormkey = GlobalKey<FormState>();

  late TextEditingController emailController;
  var email = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
  }

  //---------------------------Forget Password Api------------------------------
  Future<void> checkForgot() async {
    final isValid = forgotFormkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    forgotFormkey.currentState!.save();
    final Map<String, dynamic> data = <String, dynamic>{};

    data['user_email'] = email;
    try {
      var response =
          await ApiService.post(NetworkStrings.forgotEndpoint, data, false)
              .timeout(
        const Duration(seconds: 20),
      )
      ;
      var values = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        var obj = forgotModel.fromJson(values);

        Toast_Message(obj.msg.toString());

        user_id = obj.userId;
        //-----------------------Go to OTP VERIFICATION-------------------------
        Get.toNamed(Paths.OTP_VERIFICATION_SCREEN_ROUTE,
            arguments: [true, user_id]);
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
