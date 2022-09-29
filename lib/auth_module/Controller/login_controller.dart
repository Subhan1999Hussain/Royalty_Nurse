import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:royalty_nurse/Services/api_services.dart';
import 'package:royalty_nurse/Services/firebase_messaging.dart';
import 'package:royalty_nurse/auth_module/Model/login_model.dart';
import 'package:royalty_nurse/custom_widget_folder/loader.dart';
import 'package:royalty_nurse/custom_widget_folder/snack_bar.dart';
import 'package:royalty_nurse/custom_widget_folder/toast.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

final box = GetStorage();
dynamic user_id;

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormkey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  //----------------------------------Login Api---------------------------------
  Future<void> checkLogin() async {
    final isValid = loginFormkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormkey.currentState!.save();
    final Map<String, dynamic> data = <String, dynamic>{};
    FirebaseMessagingService firebase = FirebaseMessagingService();
    // String? devicetoken = await firebase.getToken();

    data['user_email'] = email;
    data['user_password'] = password;
    data['user_device_token'] = await firebase.getToken();
    try {
      var response =
          await ApiService.post(NetworkStrings.signinEndpoint, data, false)
              .timeout(
        const Duration(seconds: 20),
      );
      var values = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        var obj = LoginModel.fromJson(values);
        // print(devicetoken);
        //   print("========================================");
        if (obj.data!.verified == 1) {
          await box.write("token", obj.data!.token);
          await box.write("full_name", obj.data!.fullName);

          if (obj.data!.fullName == null) {
            SnackBar_Message(obj.msg!);
            //------------------------Go to Profile Setup-----------------------
            Get.offAllNamed(Paths.PROFILE_SETUP_SCREEN_ROUTE);
          } else {
            SnackBar_Message(obj.msg!);
            //------------------------Go to Main Menu-----------------------
            Get.offAllNamed(Paths.BOTTOM_NAVIGATION_SCREEN_ROUTE);
            await box.write("user_email", obj.data!.userEmail);
            await box.write("user_Image", obj.data!.userImage);
            await box.write("license_num", obj.data!.licenseNum.toString());
            await box.write("ssn", obj.data!.ssn.toString());
            await box.write("position", obj.data!.position);
          }
        } else {
          SnackBar_Message(obj.msg! + obj.data!.code.toString());
          user_id = obj.data!.id;
          Toast_Message(obj.data!.code.toString());
          //------------------------Go to OTP VERIFICATION-----------------------
          Get.offAllNamed(Paths.OTP_VERIFICATION_SCREEN_ROUTE,
              arguments: [false, user_id]);
        }
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
