import 'package:bookia/core/utils/validation.dart';

class Validators {
  // Validator Password
  String? validatorPassword(String? input) {
    if (input!.isEmpty) {
      return "Please enter your password";
    } else if (input.length < 6) {
      return "Password must be at least 6 characters";
    } else if (!isPassword(input)) {
      return "Password must contain at least one uppercase letter and one number";
    }
    return null;
  }

  // Validator Confirm Password
  String? validatorConfirmPassword(String? input, String password) {
    if (input!.isEmpty) {
      return "Please enter your password";
    } else if (input.length < 6) {
      return "Password must be at least 6 characters";
    } else if (!isConfirmPassword(password, input)) {
      return "Passwords do not match";
    }
    return null;
  }
  // Validator Confirm Password

  // Validator Email
  String? validatorEmail(String? value) {
    if (value!.isEmpty) {
      return "Please enter your email";
    } else if (!isEmailValid(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  // Validator Name
  String? validatorName(String? value) {
    if (value!.isEmpty) {
      return "Please enter your name";
    } else if (!isName(value)) {
      return "Enter a valid name";
    }
    return null;
  }
}
