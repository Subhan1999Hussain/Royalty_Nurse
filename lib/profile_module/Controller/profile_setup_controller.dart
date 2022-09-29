import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:royalty_nurse/Services/connectivity_manager.dart';
import 'package:royalty_nurse/custom_widget_folder/loader.dart';
import 'package:royalty_nurse/custom_widget_folder/snack_bar.dart';
import 'package:royalty_nurse/profile_module/Model/profile_model.dart';
import 'package:royalty_nurse/utils/Routes/app_pages.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

final box = GetStorage();
dynamic user_id;

class ProfileSetupControler extends GetxController {
  final GlobalKey<FormState> profileSetupFormkey = GlobalKey<FormState>();

  var isprofilepicpathset = false.obs;
  var profilepicpath = "".obs;
  late TextEditingController fullnameController,
      licensenumberController,
      ssnController;
  var fullname = '';
  var licensenumber = '';
  var ssn = '';
  var option = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fullnameController = TextEditingController();
    licensenumberController = TextEditingController();
    ssnController = TextEditingController();
  }

  @override
  void onClose() {
    fullnameController.dispose();
    licensenumberController.dispose();
    ssnController.dispose();
  }

  void setprofilepath(String path) {
    profilepicpath.value = path;
    isprofilepicpathset.value = true;
  }

  Future<void> setupProfile() async {
    final isValid = profileSetupFormkey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      profileSetupFormkey.currentState!.save();
      showLoading();

      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        try {
          var token = box.read('token');
          Map<String, String> header = {"Authorization": 'Bearer $token'};
          var uri = Uri.parse(NetworkStrings.baseUrl +
              NetworkStrings.api +
              NetworkStrings.setupProfleEndpont);
          var request = http.MultipartRequest('POST', uri);
          request.headers.addAll(header);
          request.fields['full_name'] = fullname;
          request.fields['license_num'] = licensenumber;
          request.fields['ssn'] = ssn;
          request.fields['position'] = option.value;

          if (profilepicpath.value.isNotEmpty) {
            var multipart =
                http.MultipartFile.fromPath('user_Image', profilepicpath.value);

            request.files.add(await multipart);
          }
          var streamResponse = await request.send();

          var response = await http.Response.fromStream(streamResponse)
          .timeout(
            const Duration(seconds: 8),
          )
          ;
          var values = jsonDecode(response.body);
          if (response.statusCode == 200) {
            var obj = ProfleModel.fromJson(values);

            await box.write("full_name", obj.user!.fullName);
            await box.write("user_email", obj.user!.userEmail);
            await box.write("user_Image", obj.user!.userImage);
            await box.write("license_num", obj.user!.licenseNum.toString());
            await box.write("ssn", obj.user!.ssn);
            await box.write("position", obj.user!.position);

            stopLoading();

            SnackBar_Message(obj.msg!);
            Get.offAllNamed(Paths.UPLOAD_DOCUMENTS_SCREEN_ROUTE);
          } else {
            stopLoading();

            SnackBar_Message("Failed To load image in Server" );
          }
        } on TimeoutException catch (_) {
          stopLoading();
          SnackBar_Message("Server Problem");
        } catch (_) {
          stopLoading();
          SnackBar_Message("App is not working correct contact Admin");
        }
      } else {
        stopLoading();
        SnackBar_Message("NO_INTERNET_CONNECTION");
        return;
      }
    }
  }
}
