import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/model/auth/refreshToken_response.dart';
import 'package:mukgen_flutter_v1/secret.dart';

Future<RefreshTokenResponse> postRefreshToken(String accessToken, String refreshToken) async {

  Map<String, dynamic> data = {
    "accessToken" : accessToken,
    "refreshToken" : refreshToken
  };

  var body = json.encode(data);

  final response = await http.post(
      Uri.parse("$baseUrl/auth/re-issue"),
      headers: {"Content-Type": "application/json",},
      body: body);
  if (response.statusCode == 200) {
    return RefreshTokenResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else{
    print(utf8.decode(response.bodyBytes));
    print(response.statusCode.toString());
    throw Exception(response.body);
  }
}
