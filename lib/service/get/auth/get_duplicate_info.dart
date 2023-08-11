import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/secret.dart';

Future<bool> getDuplicateInfo(String accountId) async {
  final response = await http.get(
    Uri.parse("$baseUrl/auth/duplicate?accountId=$accountId"),
    headers: {"Content-Type": "application/json",},
  );
  if (response.statusCode == 200) {
    print(response.body);
    return jsonDecode(response.body);
  } else {
    print('실패');
    return false;
  }
}
