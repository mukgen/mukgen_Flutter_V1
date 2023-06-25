import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/model/auth/login_response.dart';
import 'package:mukgen_flutter_v1/secret.dart';

Future<LoginResponse> postLogin(String accountId, String password) async {

  Map<String, dynamic> data = {
    "accountId" : accountId,
    "password" : password,
  };

  var body = json.encode(data);

  final response = await http.post(
      Uri.parse("$baseUrl/auth/login"),
      headers: {"Content-Type": "application/json",},
      body: body);
  if (response.statusCode == 200) {
    return LoginResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else{
    print(utf8.decode(response.bodyBytes));
    print(response.statusCode.toString());
    throw Exception(response.body);
  }
}
