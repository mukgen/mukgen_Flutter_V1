import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/model/auth/duplicate_response.dart';
import 'package:mukgen_flutter_v1/secret.dart';

Future<DuplicateResponse> getDuplicateInfo(String accountId) async {
  final response = await http.get(
    Uri.parse("$baseUrl/auth/duplicate?accountId=$accountId"),
    headers: {
      "Content-Type": "application/json",
      "X-Not-Using-Xquare-Auth": "true",
    },
  );
  if (response.statusCode == 200) {
    return DuplicateResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}
