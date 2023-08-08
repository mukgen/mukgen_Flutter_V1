import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/common/common.dart';

class Validation {
  static String getValidation(
      String input, String inputCondition, int minLength, int maxLength, String fieldName) {
    if (input.isEmpty) {
      return inputCondition;
    } else if (input.length < minLength || input.length > maxLength) {
      return "조건에 맞지 않습니다.";
    } else {
      return "사용 가능한 $fieldName입니다.";
    }
  }

  static String getPwdValidation(String password, {String? confirmPassword}) {
    RegExp passwordRegex =
    RegExp(r'^(?=.*[!@#$%^&*])(?=.{1,20}$).*'); // 비밀번호 정규식

    if (password.isEmpty) {
      return "특수문자 최소 1자 포함, 최대 20자";
    } else if (!passwordRegex.hasMatch(password)) {
      return "조건에 맞지 않습니다.";
    } else if (confirmPassword != null && password != confirmPassword) {
      return "비밀번호가 일치하지 않습니다.";
    } else {
      return "사용 가능한 비밀번호입니다.";
    }
  }

  static bool _getValidationColor(String input, int minLength, int maxLength) {
    return input.isEmpty || (input.length >= minLength && input.length <= maxLength);
  }

  static Color getFieldColor(String input, int minLength, int maxLength) {
    if (input.isEmpty) {
      return MukGenColor.primaryLight2;
    } else if (_getValidationColor(input, minLength, maxLength)) {
      return MukGenColor.green;
    } else {
      return MukGenColor.red;
    }
  }

  static Color getPwdFieldColor(String password, {String? confirmPassword}) {
    RegExp passwordRegex = RegExp(r'^(?=.*[!@#$%^&*])(?=.{8,20}$)'); // 비밀번호 정규식

    if (password.isEmpty) {
      return MukGenColor.primaryLight2;
    } else if (passwordRegex.hasMatch(password)) {
      return MukGenColor.green;
    } else {
      return MukGenColor.red;
    }
  }
}


