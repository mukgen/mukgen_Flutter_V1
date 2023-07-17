import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/model/review/rank_review.dart';
import 'package:mukgen_flutter_v1/secret.dart';

Future<ReviewRank> getReviewRankInfo() async {
  const storage = FlutterSecureStorage();
  dynamic accessToken = await storage.read(key: 'accessToken');
  final response = await http.get(
    Uri.parse("$baseUrl/review/rank"),
    headers: <String, String>{"Authorization": "Bearer $accessToken"},
  );
  if (response.statusCode == 200) {
    return ReviewRank.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    throw Exception(response.body);
  }
}
