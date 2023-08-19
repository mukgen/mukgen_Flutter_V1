import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/secret.dart';

Future<int> postGeneralSignupInfo(String nickname, String accountId, String password,
    String passwordCheck, String phoneNumber, String mail) async {
  Map<String, dynamic> data = {
    "nickname": nickname,
    "accountId": accountId,
    "password": password,
    "passwordCheck": passwordCheck,
    "phoneNumber": phoneNumber,
    "mail": mail,
  };

  var body = json.encode(data);

  final response = await http.post(
    Uri.parse("$baseUrl/auth/signup/general"),
    headers: {
      "Content-Type": "application/json",
    },
    body: body,
  );
  if (response.statusCode == 200) {
    return 1;
  } else {
    print(body);
    print(utf8.decode(response.bodyBytes));
    return 0;
  }
}
