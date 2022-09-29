import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:royalty_nurse/Services/connectivity_manager.dart';
class FirebaseMessagingService {
  static ConnectivityManager? _connectivityManager;
  static FirebaseMessagingService? _messagingService;
  static FirebaseMessaging? _firebaseMessaging;
  FirebaseMessagingService._createInstance();
  factory FirebaseMessagingService() {
    // factory with constructor, return some value
    if (_messagingService == null) {
      _messagingService = FirebaseMessagingService
          ._createInstance(); // This is executed only once, singleton object
      _firebaseMessaging = _getMessagingService();
      _connectivityManager = ConnectivityManager();
    }
    return _messagingService!;
  }
  static FirebaseMessaging _getMessagingService() {
    return _firebaseMessaging ??= FirebaseMessaging.instance;
  }
  Future<String?> getToken() async {
    if (await _connectivityManager!.isInternetConnected()) {
      return _firebaseMessaging!.getToken();
    } else {
      //AppDialogs.showToast(message: NetworkStrings.NO_INTERNET_CONNECTION);
      return null;
    }
  }}