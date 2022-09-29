import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:royalty_nurse/Services/api_services.dart';
import 'package:royalty_nurse/Services/connectivity_manager.dart';
import 'package:royalty_nurse/Services/firebase_messaging.dart';
import 'package:royalty_nurse/auth_module/Model/social_model.dart';
import 'package:royalty_nurse/custom_widget_folder/loader.dart';
import 'package:royalty_nurse/custom_widget_folder/snack_bar.dart';
import 'package:royalty_nurse/custom_widget_folder/toast.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

final box = GetStorage();
dynamic user_id;

class PreLoginController extends GetxController {
  //-----------------------------Google SignUp----------------------------------
  static googleSignUp(String social_type) async {
    ConnectivityManager _connectivityManager = ConnectivityManager();
    if (await _connectivityManager.isInternetConnected() == true) {
      try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      // FirebaseMessagingService firebase = FirebaseMessagingService();
      String? devicetoken = await FirebaseMessaging.instance.getToken();
      //--------------------------Google SignOut-------------------------------
      if (googleUser != null) {
        await _googleSignIn.signOut();
      }

      //--------------------------Social Login Api----------------------------
      final Map<String, dynamic> data = <String, dynamic>{};
      data['user_social_token'] = googleUser!.id.toString();
      data['user_social_type'] = social_type;
      data['user_device_type'] = googleUser.id;
      data['user_device_token'] = devicetoken!;
      data['user_email'] = googleUser.email;
      var response =
          await ApiService.post(NetworkStrings.socialEndpoint, data, false)
                .timeout(
          const Duration(seconds: 8),
          )
          ;
      var values = jsonDecode(response!.body);

      if (response.statusCode == 200) {
        var obj = SocialModel.fromJson(values);
        if (obj.data!.verified == 1) {
          await box.write("token", obj.data!.userAuthentication);
          print(box.read("token"));
          print("YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
          box.write("social", social_type);
          if (obj.data!.fullName == null) {
            SnackBar_Message(obj.message!);

            //------------------Go to Profile Setup---------------------------
            Get.offAllNamed(Paths.PROFILE_SETUP_SCREEN_ROUTE);
          } else {
            await box.write("full_name", obj.data!.fullName);
            await box.write("user_email", obj.data!.userEmail);
            await box.write("user_Image", obj.data!.userImage);
            await box.write("license_num", obj.data!.licenseNum.toString());
            await box.write("ssn", obj.data!.ssn.toString());
            await box.write("position", obj.data!.position);
            print("||||||||||||||||||||||||||||||||||||||||||");
            print(box.read("full_name"));
            print(box.read("user_email"));
            print(box.read("user_Image"));
            print(box.read("license_num"));
            print(box.read("ssn"));
            print(box.read("position"));
            print("...........................................");
            SnackBar_Message(obj.message!);
            //------------------------Go to Main Menu-----------------------
            Get.offAllNamed(Paths.BOTTOM_NAVIGATION_SCREEN_ROUTE);
          }
        } else {
          SnackBar_Message(obj.message!);
          user_id = obj.data!.id;
          Toast_Message(obj.data!.code.toString());
          //----------------------Go to OTP VERIFICATION----------------------
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
        print(_);
      }
    } else {
      SnackBar_Message("NO_INTERNET_CONNECTION");
      return null;
    }
  }
}
