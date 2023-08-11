import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/service/get/auth/get_duplicate_info.dart';
import 'package:mukgen_flutter_v1/widget/text_field_duplicate.dart';

class Validation {
  static String getValidation(String input, String inputCondition,
      int minLength, int maxLength, String fieldName) {
    if (input.isEmpty) {
      return inputCondition;
    } else if (input.length < minLength || input.length > maxLength) {
      return "조건에 맞지 않습니다.";
    } else {
      return "사용 가능한 $fieldName입니다.";
    }
  }

  static String getEmailValidation(String input) {
    RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+$');
    if (input.isNotEmpty) {
      if (!emailRegex.hasMatch(input)) {
        return "잘못된 유형의 이메일 주소입니다.";
      }
    }
    return "";
  }

  static String getIdValidation(String input) {
    if (input.isEmpty) {
      return '최소 5자, 최대 15자';
    } else if (input.length < 5 || input.length > 15) {
      return "조건에 맞지 않습니다.";
    } else {
      if (DuplicateResult.isDuplicate == true) {
        if (DuplicateResult.duplicateState == true) {
          return "중복된 아이디입니다.";
        } else if (DuplicateResult.duplicateState == false) {
          return "사용 가능한 아이디입니다.";
        }
      }
      return "중복 여부를 확인해주세요.";
    }
  }

  static String getPwdValidation(String password, {String? confirmPassword}) {
    RegExp passwordRegex =
        RegExp(r'^(?=.*[!@#$%^&*])(?=.{1,20}$).*'); // 비밀번호 정규식

    if (password.isEmpty) {
      return "특수문자 최소 1자 포함, 최대 20자";
    } else if (confirmPassword != null && password != confirmPassword) {
      return "비밀번호가 일치하지 않습니다.";
    } else if (!passwordRegex.hasMatch(password)) {
      return "조건에 맞지 않습니다.";
    } else if (confirmPassword != null && password == confirmPassword) {
      return "비밀번호가 일치합니다.";
    } else {
      return "사용 가능한 비밀번호입니다.";
    }
  }

  static bool _getValidationColor(String input, int minLength, int maxLength) {
    return input.isEmpty ||
        (input.length >= minLength && input.length <= maxLength);
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

  static Color getIdFieldColor(String input) {
    if (input.isEmpty) {
      return MukGenColor.primaryLight2;
    } else if (input.length < 5 || input.length > 15) {
      return MukGenColor.red;
    } else {
      if (DuplicateResult.isDuplicate == true) {
        if (DuplicateResult.duplicateState == true) {
          return MukGenColor.red;
        } else if (DuplicateResult.duplicateState == false) {
          return MukGenColor.green;
        }
      }
      return MukGenColor.red;
    }
  }

  static Color? getEmailFieldColor(String input) {
    RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+$');
    if (!emailRegex.hasMatch(input)) {
      return MukGenColor.red;
    }
    return null;
  }

  static Color getPwdFieldColor(String password, {String? confirmPassword}) {
    RegExp passwordRegex =
        RegExp(r'^(?=.*[!@#$%^&*])(?=.{1,20}$).*'); // 비밀번호 정규식

    if (password.isEmpty) {
      return MukGenColor.primaryLight2;
    } else if (passwordRegex.hasMatch(password)) {
      if (confirmPassword != null && password != confirmPassword) {
        return MukGenColor.red; // 빨간색
      } else {
        return MukGenColor.green; // 초록색
      }
    } else {
      return MukGenColor.red;
    }
  }
}
