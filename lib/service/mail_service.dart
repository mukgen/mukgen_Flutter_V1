import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/secret.dart';

class MailService {
  static const _url = "$baseUrl/mail";

  MailService._();

  static Future<int> postSendMailInfo(String mail) async {
    Map<String, dynamic> data = {
      "mail": mail,
    };

    final response = await http.post(
      Uri.parse("$_url/send"),
      headers: {
        "Content-Type": "application/json",
        "X-Not-Using-Xquare-Auth": "true",
      },
      body: jsonEncode(data),
    );

    if (response.statusCode != 200) {
      return 0;
    }
    debugPrint(utf8.decode(response.bodyBytes));
    return 1;
  }

  static Future<bool> postAuthenticateMailInfo(String mail, String code) async {
    Map<String, dynamic> data = {
      "mail": mail,
      "code": code,
    };

    final response = await http.post(
      Uri.parse("$_url/authenticate"),
      headers: {
        "Content-Type": "application/json",
        "X-Not-Using-Xquare-Auth": "true",
      },
      body: jsonEncode(data),
    );

    if (response.statusCode != 200) {
      print(response.statusCode);
      return false;
    }
    debugPrint(utf8.decode(response.bodyBytes));
    return true;
  }
}
