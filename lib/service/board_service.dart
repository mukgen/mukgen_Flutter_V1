import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mukgen_flutter_v1/model/board/detail_board.dart';
import 'package:mukgen_flutter_v1/model/board/hot_board.dart';
import 'package:mukgen_flutter_v1/model/board/like_board.dart';
import 'package:mukgen_flutter_v1/model/board/total_board.dart';
import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/secret.dart';

class BoardService {
  static const _storage = FlutterSecureStorage();
  static const _url = "$baseUrl/board";

  BoardService._();

  static Future<BoardResponse> getBoardInfo(String query) async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    final response = await http.get(
      Uri.parse("$_url/$query"),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "X-Not-Using-Xquare-Auth": "true",
      },
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return BoardResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }

  static Future<DetailBoard> getDetailBoardInfo(int boardId) async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    final response = await http.get(
      Uri.parse("$_url/${boardId.toString()}"),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "X-Not-Using-Xquare-Auth": "true",
      },
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return DetailBoard.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }

  static Future<HotBoard> getHotBoardInfo() async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    final response = await http.get(
      Uri.parse("$_url/hot"),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "X-Not-Using-Xquare-Auth": "true"
      },
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return HotBoard.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }

  static Future<int> postBoardCommentInfo(int boardId, String content) async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    Map<String, dynamic> data = {
      "boardId": boardId,
      "content": content,
    };

    final response = await http.post(Uri.parse("$baseUrl/board-comment"),
        headers: <String, String>{
          "Authorization": "Bearer $accessToken",
          "Content-Type": "application/json",
          "X-Not-Using-Xquare-Auth": "true",
        },
        body: jsonEncode(data));
    if (response.statusCode != 201) {
      debugPrint(utf8.decode(response.bodyBytes));
      return 0;
    }
    return 1;
  }

  static Future<int> postBoardInfo(String title, String content) async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    Map<String, String> data = {
      "title": title,
      "content": content,
    };

    final response = await http.post(Uri.parse(_url),
        headers: <String, String>{
          "Authorization": "Bearer $accessToken",
          "Content-Type": "application/json",
          "X-Not-Using-Xquare-Auth": "true",
        },
        body: jsonEncode(data));
    if (response.statusCode != 201) {
      debugPrint(utf8.decode(response.bodyBytes));
      return 0;
    }
    return 1;
  }

  static Future<LikeBoard> postLikeBoardInfo(int boardId) async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    final response = await http.post(
      Uri.parse("$baseUrl/like/${boardId.toString()}"),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "X-Not-Using-Xquare-Auth": "true",
      },
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return LikeBoard.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }
}
