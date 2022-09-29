import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:royalty_nurse/Services/api_services.dart';
import 'package:royalty_nurse/Services/connectivity_manager.dart';
import 'package:royalty_nurse/custom_widget_folder/loader.dart';
import 'package:royalty_nurse/custom_widget_folder/snack_bar.dart';
import 'package:royalty_nurse/documents_module/Model/get_document_model.dart';
import 'package:royalty_nurse/documents_module/Model/upload_document_model.dart';
import 'package:royalty_nurse/documents_module/Screens/administrator_alert_box.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

class DocumentsController extends GetxController {
  final box = GetStorage();
  var search = TextEditingController();
  List<Documents> documents = <Documents>[];
  File? image;
  final _picker = ImagePicker();
  late PlatformFile fileselected;
  Map<String, String> images = <String, String>{};

  @override
  void onInit() {
    super.onInit();
    GetDocument();
  }

//----------------------------------Get Documents Api---------------------------------
  Future<DocumentModel?> GetDocument() async {
    try {
      var response =
          await ApiService.get(NetworkStrings.getdocumentEndpont, true).timeout(
        const Duration(seconds: 20),
      );

      var values = jsonDecode(response!.body);
      var obj = DocumentModel.fromJson(values);
      if (response.statusCode == 200) {
        documents = obj.data!;
        update();
      } else {
        SnackBar_Message(obj.message!);
      }
    } on TimeoutException catch (_) {
      stopLoading();
      SnackBar_Message("Server Problem");
    } catch (_) {
      stopLoading();
      SnackBar_Message("App is not working correct contact Admin");
    }
  }

//----------------------------------Get File---------------------------------
  Future getFile(model) async {
    try {
      final pickedFile = await FilePicker.platform.pickFiles(
          allowCompression: false,
          type: FileType.custom,
          allowedExtensions: ['jpg', 'pdf', 'png']);
      if (pickedFile != null) {
        fileselected = pickedFile.files.first;

        images[model.toString()] = fileselected.path!;

        update();
      }
    } catch (_) {
      stopLoading();
      print(_);
      SnackBar_Message("Failed to load the Image");
    }
  }

//----------------------------------Uplad Documents Api-------------------------------
  Future<void> uploadDocs(context, bool fromSetupProfile) async {
    var token = box.read('token');
    Map<String, String> header = {"Authorization": 'Bearer $token'};
    showLoading();
    ConnectivityManager _connectivityManager = ConnectivityManager();
    if (await _connectivityManager.isInternetConnected() == true) {
      try {
        var uri = Uri.parse(NetworkStrings.baseUrl +
            NetworkStrings.api +
            NetworkStrings.uploaddocumentEndpont);
        var request = http.MultipartRequest('POST', uri);
        request.headers.addAll(header);

        var multipart;

        images.forEach((k, v) async {
          multipart = http.MultipartFile.fromPath(k, v);
          request.files.add(await multipart);
        });

        var streamResponse = await request.send();
        var response = await http.Response.fromStream(streamResponse).timeout(
          const Duration(seconds: 8),
        );
        var body = jsonDecode(response.body);
        var obj = UploadDocumentModel.fromJson(body);
        if (response.statusCode == 200) {
          print(body);

          print(obj.msg);
          if (fromSetupProfile) {
            //------------------Go to Administrator Alert Box-------------------
            showDialog(
                context: context,
                builder: (context) => AdministratorAlertBox());
          } else {
            stopLoading();
            Get.back();
            SnackBar_Message(obj.msg!);
          }
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
    } else {
      stopLoading();
      SnackBar_Message("NO_INTERNET_CONNECTION");

      return;
    }
  }
}
