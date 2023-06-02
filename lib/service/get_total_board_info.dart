import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/model/board/total_board.dart';
import 'package:mukgen_flutter_v1/secret.dart';

Future<BoardResponse> getTotalBoardInfo() async {
  final response = await http.get(
    Uri.parse("$baseUrl/board/total"),
    headers: <String, String>{"Authorization": token},
  );
  if (response.statusCode == 200) {
    return BoardResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    throw Exception(response.body);
  }
}