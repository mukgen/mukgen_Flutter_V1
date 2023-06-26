import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/secret.dart';

Future<int> postGeneralSignup(String name, String accountId, String password, String passwordCheck, String phoneNumber) async {

  Map<String, dynamic> data = {"name": name,
              "accountId" : accountId,
              "password" : password,
              "passwordCheck" : passwordCheck,
              "phoneNumber" : phoneNumber };

  var body = json.encode(data);

  final response = await http.post(
    Uri.parse("$baseUrl/auth/signup/general"),
    headers: {"Content-Type": "application/json",},
    body: body);
  if (response.statusCode == 200) {
    return 1;
  } else{
    print(utf8.decode(response.bodyBytes));
    return 0;
  }
}
