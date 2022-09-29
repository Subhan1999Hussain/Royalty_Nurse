import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royalty_nurse/Services/api_services.dart';
import 'package:royalty_nurse/auth_module/Model/signup_model.dart';
import 'package:royalty_nurse/custom_widget_folder/loader.dart';
import 'package:royalty_nurse/custom_widget_folder/snack_bar.dart';
import 'package:royalty_nurse/custom_widget_folder/toast.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

dynamic user_id;

class SignupController extends GetxController {
  final GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();

  late TextEditingController emailController,
      passwordController,
      confirmPasswordController;
  var email = '';
  var password = '';
  var confirmpassword = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
  //-------------------------------SignUp Api-----------------------------------
  Future<void> checkSignup() async {

    final Map<String, dynamic> data = <String, dynamic>{};

    data['user_email'] = email;
    data['user_password'] = password;
    data['confirm_password'] = confirmpassword;
    try {
      var response =
          await ApiService.post(NetworkStrings.signupEndpoint, data, false)
              .timeout(
        const Duration(seconds: 20),
      )
      ;
      var values = jsonDecode(response!.body);

      if (response.statusCode == 201) {
        var obj = SignupModel.fromJson(values);
        SnackBar_Message(obj.msg);
        user_id = obj.data.id;    
        Toast_Message(obj.data.code.toString());
        //-------------------------Go to OTP VERIFICATION-----------------------
        Get.offNamed(Paths.OTP_VERIFICATION_SCREEN_ROUTE,
            arguments: [false, user_id]);
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
