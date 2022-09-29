import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';

final box = GetStorage();

class SplashController extends GetxController {
  @override
  onInit() {
    Timer(
      const Duration(seconds: 3),
      () => checkTokenThenNavigate(),
    );
    super.onInit();
  }

  checkTokenThenNavigate() {
    if (box.read("token") != null) {
      if (box.read("full_name") != null) {
        //------------------------Go to Main Menu-----------------------
        Get.offNamed(Paths.BOTTOM_NAVIGATION_SCREEN_ROUTE);
      } else {
        //------------------------Go to Profile Setup-----------------------
        Get.offNamed(Paths.PROFILE_SETUP_SCREEN_ROUTE);
      }
    } else {
      //------------------------Go to Pre Login-----------------------
      Get.offNamed(Paths.PRE_LOGIN_SCREEN_ROUTE);
    }
  }
}
