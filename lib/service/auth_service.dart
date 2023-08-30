import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mukgen_flutter_v1/model/auth/duplicate_response.dart';
import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/model/auth/login_response.dart';
import 'package:mukgen_flutter_v1/model/auth/refreshToken_response.dart';
import 'package:mukgen_flutter_v1/secret.dart';

class AuthService {
  static const _url = "$baseUrl/auth";

  static Future<DuplicateResponse> getDuplicateInfo(String accountId) async {
    final response = await http.get(
      Uri.parse("$_url/duplicate?accountId=$accountId"),
      headers: {
        "Content-Type": "application/json",
        "X-Not-Using-Xquare-Auth": "true",
      },
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return DuplicateResponse.fromJson(jsonDecode(response.body));
  }

  static Future<bool> postGeneralSignupInfo(
      String nickname,
      String accountId,
      String password,
      String passwordCheck,
      String phoneNumber,
      String mail) async {
    Map<String, dynamic> data = {
      "nickname": nickname,
      "accountId": accountId,
      "password": password,
      "passwordCheck": passwordCheck,
      "phoneNumber": phoneNumber,
      "mail": mail,
    };

    final response = await http.post(
      Uri.parse("$_url/signup/general"),
      headers: {
        "Content-Type": "application/json",
        "X-Not-Using-Xquare-Auth": "true",
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<LoginResponse> postLoginInfo(
      String accountId, String password) async {
    Map<String, dynamic> data = {
      "accountId": accountId,
      "password": password,
    };

    final response = await http.post(Uri.parse("$_url/login"),
        headers: {
          "Content-Type": "application/json",
          "X-Not-Using-Xquare-Auth": "true",
        },
        body: jsonEncode(data));
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    debugPrint(response.body);
    return LoginResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }

  static Future<RefreshTokenResponse> postRefreshTokenInfo(
      String accessToken, String refreshToken) async {
    Map<String, dynamic> data = {
      "accessToken": accessToken,
      "refreshToken": refreshToken
    };

    final response = await http.post(Uri.parse("$_url/re-issue"),
        headers: {
          "Content-Type": "application/json",
          "X-Not-Using-Xquare-Auth": "true",
        },
        body: jsonEncode(data));
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return RefreshTokenResponse.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)));
  }
}
