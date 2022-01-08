import 'package:schoolgate/utils/app_strings.dart';

class ValidationService {
  bool validateEmail(email) {
    RegExp exp = RegExp(AppStrings.emailPattern.trim());
    if (!exp.hasMatch(email)) {
      return false;
    } else {
      return true;
    }
  }

  bool validatePhone(phone) {
    if (isNumeric(phone)) {
      RegExp exp = RegExp(AppStrings.phonePattern);
      if (!exp.hasMatch(phone)) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  bool validatePassword(String password) {
    // bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    // bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    // bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    // bool hasSpecialCharacters =
    //     password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    if (password.length < 8) {
      return false;
    } else {
      return true;
    }
  }
}
