import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/secret.dart';

Future<int> postDeliveryPartyInfo(
    String menu, int participantNumber, String place, String meetTime) async {
  const storage = FlutterSecureStorage();
  dynamic accessToken = await storage.read(key: 'accessToken');
  Map<String, dynamic> data = {
    "menu": menu,
    "participantNumber": participantNumber,
    "place": place,
    "meetTime": meetTime,
  };

  var body = json.encode(data);

  final response = await http.post(Uri.parse("$baseUrl/delivery-party"),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
        "X-Not-Using-Xquare-Auth": "true",
      },
      body: body);
  if (response.statusCode == 201) {
    print("성공");
    return 1;
  } else {
    print("실패");
    print(response.statusCode.toString()); // 오류 코드 출력
    print(utf8.decode(response.bodyBytes)); // 서버에서 주는 오류 메시지 출력
    return 0;
  }
}
