import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:royalty_nurse/Services/api_services.dart';
import 'package:royalty_nurse/custom_widget_folder/loader.dart';
import 'package:royalty_nurse/custom_widget_folder/snack_bar.dart';
import 'package:royalty_nurse/terms_policy/Models/terms_privacy_model.dart';

class TermsPrivacyController extends GetxController {
  RxString termsContent = ''.obs, privacyContent = ''.obs;

  //------------Terms & Condition Privacy Policy Api---------------------------------
  Future<void> GetTermsPrivacy(bool terms, endpoint) async {
    try {
      var response = await ApiService.get(endpoint, false)
      .timeout(
        const Duration(seconds: 20),
      )
      ;
      var values = jsonDecode(response!.body);
      var obj = TermsPrivacyModel.fromJson(values);

      if (response.statusCode == 200) {
        //---------------Terms & Condition Content----------------------
        if (terms) {
          termsContent.value = obj.message[0].content;
        }
        //---------------Privacy Policy Content-----------------------
        else {
          privacyContent.value = obj.message[0].content;
        }
      } else {
        SnackBar_Message(obj.status.toString());
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
