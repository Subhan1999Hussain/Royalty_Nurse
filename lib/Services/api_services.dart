import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:royalty_nurse/Services/connectivity_manager.dart';
import 'package:royalty_nurse/custom_widget_folder/loader.dart';
import 'package:royalty_nurse/custom_widget_folder/snack_bar.dart';
import 'package:royalty_nurse/utils/network_strings.dart';

class ApiService {
  //------------------Making Client for Http Request----------------------
  static final client = http.Client();

  //-----------------------------API URL----------------------------------
  static Uri _buildUrl(String endpoint) {
    final apiPath = NetworkStrings.baseUrl + NetworkStrings.api + endpoint;
    return Uri.parse(apiPath);
  }

  //-------------------------Post Api Function----------------------------
  static Future<http.Response?> post(
      String endpoint, var body, bool header) async {
    showLoading();

    //-----------------InterNet Connectivity Check------------------------
    ConnectivityManager _connectivityManager = ConnectivityManager();
    if (await _connectivityManager.isInternetConnected() == true) {
      //----------------------With Bearer Token---------------------------
      if (header == true) {
        final box = GetStorage();
        var token = box.read("token");
        var response = await client.post(_buildUrl(endpoint),
            body: body, headers: {"Authorization": 'Bearer $token'});

        stopLoading();
        return response;
      } else {
        //-------------------WithOut Bearer Token-------------------------
        var response = await client.post(_buildUrl(endpoint), body: body);

        stopLoading();
        return response;
      }
    } else {
      stopLoading();
      SnackBar_Message("NO_INTERNET_CONNECTION" );
      return null;
    }
  }

  //-------------------------Get Api Function----------------------------
  static Future<http.Response?> get(String endpoint, bool header) async {
    showLoading();

    //-----------------InterNet Connectivity Check------------------------
    ConnectivityManager _connectivityManager = ConnectivityManager();
    if (await _connectivityManager.isInternetConnected() == true) {
      //----------------------With Bearer Token---------------------------
      if (header == true) {
        final box = GetStorage();
        var token = box.read("token");
        var response = await client.get(_buildUrl(endpoint),
            headers: {"Authorization": 'Bearer $token'});

        stopLoading();
        return response;
      } else {
        //-------------------WithOut Bearer Token-------------------------
        var response = await client.get(_buildUrl(endpoint));

        stopLoading();
        return response;
      }
    } else {
      stopLoading();
      SnackBar_Message("NO_INTERNET_CONNECTION" );
      return null;
    }
  }
}
