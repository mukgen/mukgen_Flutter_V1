import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/model/board/like_board.dart';
import 'package:mukgen_flutter_v1/secret.dart';

Future<LikeBoard> postLikeBoardInfo(int boardId) async {

  final response = await http.post(
    Uri.parse("$baseUrl/like/${boardId.toString()}"),
    headers: <String, String>{"Authorization": token},
  );
  if (response.statusCode == 200) {
    return LikeBoard.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    throw Exception(response.body);
  }
}