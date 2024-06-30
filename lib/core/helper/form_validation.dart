import 'package:get/get_utils/src/extensions/internacionalization.dart';

class FormValidation {
  ///Check if field isn't empty
  String? isValidLength(String value) {
    if (value.length <= 2) {
      return 'enter_valid_information'.tr;
    }
    return null;
  }

  String? isValidFirstName(String value) {
    if (value.length <= 2) {
      return 'enter_your_first_name'.tr;
    }
    return null;
  }

  String? isValidLastName(String value) {
    if (value.length <= 2) {
      return 'enter_your_last_name'.tr;
    }
    return null;
  }

  String? isValidPassword(String value) {
    if (value.length <= 5) {
      return 'Wrong password'.tr;
    }
    return null;
  }

  static bool isNotValid(String phone) {
    return !RegExp(r"^05[0-9]{8,8}$").hasMatch(phone);
  }
}
