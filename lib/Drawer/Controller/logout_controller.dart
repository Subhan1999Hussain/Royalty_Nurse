import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:royalty_nurse/Drawer/Model/logout_model.dart';
import 'package:royalty_nurse/Services/api_services.dart';
import 'package:royalty_nurse/custom_widget_folder/loader.dart';
import 'package:royalty_nurse/custom_widget_folder/snack_bar.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

class LogoutController extends GetxController {
  final box = GetStorage();

  //----------------------------------LogOut Api---------------------------------
  Future<void> logOut() async {
    try {
      var response =
          await ApiService.get(NetworkStrings.logoutEndpoint, true).timeout(
        const Duration(seconds: 20),
      );
      var values = jsonDecode(response!.body);
      var obj = LogoutModel.fromJson(values);

      if (response.statusCode == 200) {
        SnackBar_Message(obj.msg!);

        box.remove("social");
        box.remove("token");
        box.remove("full_name");
        box.remove("user_Image");
        box.remove("user_email");
        box.remove("license_num");
        box.remove("ssn");
        box.remove("position");
        //------------------------Go to Pre Login-----------------------
        Get.offAllNamed(Paths.PRE_LOGIN_SCREEN_ROUTE);
      } else {
        SnackBar_Message(obj.msg!);
      }
    } on TimeoutException catch (_) {
      stopLoading();
      SnackBar_Message("Server Problem");
    } catch (_) {
      stopLoading();
      print(_);
      SnackBar_Message("App is not working correct contact Admin");
    }
  }
}
