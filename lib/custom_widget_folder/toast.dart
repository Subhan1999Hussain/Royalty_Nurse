import 'package:fluttertoast/fluttertoast.dart';

class Toast_Message {
  Toast_Message(String toastmsg) {
    Fluttertoast.showToast(msg: toastmsg, toastLength: Toast.LENGTH_LONG);
  }
}
