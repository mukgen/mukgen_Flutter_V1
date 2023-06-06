import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/model/board/detail_board.dart';
import 'package:mukgen_flutter_v1/secret.dart';

Future<DetailBoard> getDetailBoardInfo(int boardId) async {

  final response = await http.get(
    Uri.parse("$baseUrl/board/${boardId.toString()}"),
    headers: <String, String>{"Authorization": token},
  );
  if (response.statusCode == 200) {
    return DetailBoard.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    throw Exception(response.body);
  }
}