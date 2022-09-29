import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:royalty_nurse/Services/api_services.dart';
import 'package:royalty_nurse/auth_module/Model/otp_model.dart';
import 'package:royalty_nurse/auth_module/Model/resend_code_model.dart';
import 'package:royalty_nurse/custom_widget_folder/loader.dart';
import 'package:royalty_nurse/custom_widget_folder/snack_bar.dart';
import 'package:royalty_nurse/custom_widget_folder/toast.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

final box = GetStorage();

class OtpVerificationController extends GetxController {
  final GlobalKey<FormState> otpFormkey = GlobalKey<FormState>();

  //-------------------------------Arguments--------------------------------
  dynamic args = Get.arguments;
  late TextEditingController pinController;
  var pin = '';
  var count = 10;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    StartTime();
    pinController = TextEditingController();
  }

  //-------------------------------Initial Timer--------------------------------
  void StartTime() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (count > 0) {
        count--;
        update();
      } else
        _timer.cancel();
      update();
    });
  }

  //--------------------------------Reset Timer---------------------------------
  void reset() {
    _timer.cancel();
    count = 10;
    update();
    StartTime();
    reSend();
  }

  //--------------------------------Otp Api---------------------------------
  Future<void> checkOtp() async {
    final isValid = otpFormkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    otpFormkey.currentState!.save();
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = args[1];
    data['verficationCode'] = pin;
    try {
      var response =
          await ApiService.post(NetworkStrings.verifyuserEndpoint, data, false)
              .timeout(
        const Duration(seconds: 20),
      );
      var values = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        var obj = OtpModel.fromJson(values);
        SnackBar_Message(obj.msg!);

        if (args[0] == false) {
          await box.write("token", obj.token);
          //--------------------------Go to Setup Profile-----------------------
          Get.offAllNamed(Paths.PROFILE_SETUP_SCREEN_ROUTE);
        } else {
          //------------------------Go to Reset Password------------------------
          Get.offNamed(Paths.RESET_PASSWORD_SCREEN_ROUTE, arguments: args[1]);
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

  //-----------------------------Resend Otp Code Api----------------------------
  Future<void> reSend() async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = args[1];
    try {
      var response =
          await ApiService.post(NetworkStrings.resendotpEndpoint, data, false)
              .timeout(
        const Duration(seconds: 20),
      );
      var values = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        var obj = ResendModel.fromJson(values);
        SnackBar_Message(obj.msg);
        Toast_Message(obj.code.toString());
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
