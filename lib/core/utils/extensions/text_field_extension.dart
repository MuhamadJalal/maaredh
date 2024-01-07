import 'package:maaredh/core/utils/barrel_utils.dart';

extension TextFieldValidator on String {
  String? passwordValidator(String message) {
    if (isEmpty) {
      return message;
    }

    if (!Validator().isTextLengthNotValid(this, validLength: 6)) {
      return message;
    }

    return null;
  }

  String? confirmPasswordValidator(String message, String matcher) {
    if (isEmpty) {
      return message;
    }

    if (!Validator().isTextLengthNotValid(this, validLength: 6)) {
      return message;
    }

    if (!Validator().isTextMatches(this, matcher)) {
      return message;
    }

    return null;
  }

  String? emailValidator(String message) {
    if (isEmpty) {
      return message;
    }

    if (!Validator().isEmail(this)) {
      return message;
    }

    return null;
  }
}
