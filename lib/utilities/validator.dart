import 'package:smart_pay/utilities/string_util.dart';

class Validator {
  static String? validateEmail(String? s) {
    if (StringUtil.isEmpty(s)) {
      return "Email cannot be empty";
    } else if (!StringUtil.isValidEmail(s!)) {
      return "Email must be a valid email address";
    } else {
      return null;
    }
  }

  static bool isValidEmail(String? s) {
    if (StringUtil.isEmpty(s)) {
      return false;
    } else if (!StringUtil.isValidEmail(s!)) {
      return false;
    } else {
      return true;
    }
  }

  static String? validateField(String? s, {String? errorMessage}) {
    if (StringUtil.isEmpty(s)) {
      return errorMessage ?? "Required";
    } else {
      return null;
    }
  }

  static bool isValidField(String? s) {
    if (StringUtil.isEmpty(s)) {
      return false;
    } else {
      return true;
    }
  }

  static String? validatePassword(String? s) {
    RegExp passwordRegExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (StringUtil.isEmpty(s)) {
      return "Password cannot be empty";
    } else if (s!.length < 8) {
      return "Minimum of 8 characters";
    } else if (passwordRegExp.hasMatch(s)) {
      return null;
    }
  }

  static bool isValidPassword(String? s) {
    if (StringUtil.isEmpty(s)) {
      return false;
    } else if (s!.length < 8) {
      return false;
    } else {
      return true;
    }
  }

  static bool isCodeValid(String? s, [int length = 4]) {
    if (StringUtil.isEmpty(s)) {
      return false;
    } else if (s!.length < length) {
      return false;
    } else {
      return true;
    }
  }

  static String? validateNewPassword(String? s) {
    if (StringUtil.isEmpty(s)) {
      return "Password cannot be empty";
    } else if (!StringUtil.hasLowerCase(s!)) {
      return "Password cannot be empty";
    } else if (!StringUtil.hasUpperCase(s)) {
      return "Password must contain uppercase";
    } else if (!StringUtil.hasSymbol(s)) {
      return "Password must contain symbol";
    } else if (!StringUtil.hasNumber(s)) {
      return "Password must contain number";
    } else if (s.length < 8) {
      return "Password must be greater than 6 characters";
    } else {
      return null;
    }
  }

  static bool isNewPasswordValid(String? s) {
    if (StringUtil.isEmpty(s)) {
      return false;
    } else if (!StringUtil.hasLowerCase(s!)) {
      return false;
    } else if (!StringUtil.hasUpperCase(s)) {
      return false;
    } else if (!StringUtil.hasSymbol(s)) {
      return false;
    } else if (!StringUtil.hasNumber(s)) {
      return false;
    } else if (s.length <= 6) {
      return false;
    } else {
      return true;
    }
  }

  static String? validateConfirmPassword(String? s, {String? password}) {
    if (StringUtil.isEmpty(s!.trim())) {
      return "Password cannot be empty";
    } else if (password!.trim() != s) {
      return "Passwords do not match";
    } else {
      return null;
    }
  }

  static bool isConfirmPasswordValid(String? s, {String? password}) {
    if (StringUtil.isEmpty(s!.trim())) {
      return false;
    } else if (password!.trim() != s) {
      return false;
    } else {
      return true;
    }
  }
}
