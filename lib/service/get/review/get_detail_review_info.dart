import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/model/review/detail_review.dart';
import 'package:mukgen_flutter_v1/secret.dart';

Future<DetailReview> getDetailReviewInfo(int reviewId) async {
  const storage = FlutterSecureStorage();
  dynamic accessToken = await storage.read(key: 'accessToken');
  final response = await http.get(
    Uri.parse("$baseUrl/review/$reviewId"),
    headers: <String, String>{
      "Authorization": "Bearer $accessToken",
      "X-Not-Using-Xquare-Auth": "true",
    },
  );
  if (response.statusCode == 200) {
    return DetailReview.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    throw Exception(response.body);
  }
}
