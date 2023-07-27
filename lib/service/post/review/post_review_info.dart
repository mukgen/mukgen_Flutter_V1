import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mukgen_flutter_v1/secret.dart';

Future<void> postReviewInfo(int count, String review, int riceId) async {
  const storage = FlutterSecureStorage();
  dynamic accessToken = await storage.read(key: 'accessToken');

  final response = await http.post(Uri.parse("$baseUrl/review/$riceId"+"?count="+count.toString()+"&review="+review),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json"
      });
  if (response.statusCode == 201) {
    print("성공");
  } else {
    print("실패");
    print(response.statusCode.toString()); // 오류 코드 출력
    print(utf8.decode(response.bodyBytes)); // 서버에서 주는 오류 메시지 출력
  }
}
