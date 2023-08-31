import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/model/suggestion/total_suggestion.dart';
import 'package:mukgen_flutter_v1/secret.dart';

class SuggestionService {
  static const _storage = FlutterSecureStorage();
  static const _url = "$baseUrl/meal-suggestion";

  static Future<void> postDislikeSuggestionInfo(int mealSuggestionId) async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    final response = await http.post(
      Uri.parse("$_url/dislike/$mealSuggestionId"),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "X-Not-Using-Xquare-Auth": "true",
      },
    );
    if (response.statusCode != 201) {
      throw Exception(response.body);
    }
  }

  static Future<void> postLikeSuggestionInfo(int mealSuggestionId) async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    final response = await http.post(
      Uri.parse("$_url/like/$mealSuggestionId"),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "X-Not-Using-Xquare-Auth": "true",
      },
    );
    if (response.statusCode != 201) {
      throw Exception(response.body);
    }
  }

  static Future<int> postSuggestionInfo(String content) async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    Map<String, String> data = {
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
      return 0;
    }
    return 1;
  }

  static Future<TotalSuggestion> getTotalSuggestionInfo() async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    final response = await http.get(
      Uri.parse("$_url/list"),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "X-Not-Using-Xquare-Auth": "true",
      },
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return TotalSuggestion.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)));
  }
}
