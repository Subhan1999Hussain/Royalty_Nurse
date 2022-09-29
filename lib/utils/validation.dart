import 'package:get/get.dart';

class FieldValidator {
  static RxBool isHideoldpassword = true.obs;
  static RxBool isHidepassword = true.obs;
  static RxBool isHideconfirmpassword = true.obs;
  static const String PASSWORD_VALIDATION_REGEX =
      r'^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$';

//------------- hide/Un hide--------------//
  static void oldpassword_hideIcon() {
    if (isHideoldpassword.value) {
      isHideoldpassword.value = false;
    } else {
      isHideoldpassword.value = true;
    }
  }

  static void password_hideIcon() {
    if (isHidepassword.value) {
      isHidepassword.value = false;
    } else {
      isHidepassword.value = true;
    }
  }

  static void confirm_password_hideIcon() {
    if (isHideconfirmpassword.value) {
      isHideconfirmpassword.value = false;
    } else {
      isHideconfirmpassword.value = true;
    }
  }

//------------- Name Validator--------------//
  static String? validateName(String value) {
    if (value.isEmpty) {
      return "Enter Name";
    }
    return null;
  }

//------------------ Email Validator ---------------//
  static String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

//---------------- Password Validator -----------------//
  static String? validatePassword(String value) {
    if (value.trim().isEmpty) {
      return "Required";
    } else if (!RegExp(PASSWORD_VALIDATION_REGEX).hasMatch(value)) {
      return "Must be 6 digit numeric and special character";
    }
    return null;
  }

//--------------------Confirm Password Validator--------//
  static String? validateConfirmPassword(
      String password, String confirmPassword) {
    if (password.isEmpty) {
      return 'Confirm Password';
    } else if (!(password == confirmPassword)) {
      return 'Password Not Match';
    } else {
      return null;
    }
  }

  //-----------------------OTP Validator---------------//
  static String? validatePin(String value) {
    if (value.length == 6) {
      return null;
    }
    return "Provide valid OTP";
  }

  //-----------------------Null Validator---------------//
  static String? valiadteEmpty(String value) {
    if (value.isEmpty || value == null) {
      return "Must Provide";
    }
    return null;
  }
}
