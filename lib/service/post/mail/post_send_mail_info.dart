import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/secret.dart';

Future<int> postSendMailInfo(String mail) async {
  Map<String, dynamic> data = {
    "mail": mail,
  };

  var body = json.encode(data);

  final response = await http.post(
    Uri.parse("$baseUrl/mail/send"),
    headers: {
      "Content-Type": "application/json",
      "X-Not-Using-Xquare-Auth": "true",
    },
    body: body,
  );

  if (response.statusCode == 200) {
    print("성공");
    return 1;
  } else {
    print("실패");
    print(response.statusCode.toString()); // 오류 코드 출력
    print(utf8.decode(response.bodyBytes)); // 서버에서 주는 오류 메시지 출력
    return 0;
  }
}
