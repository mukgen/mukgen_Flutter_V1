import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mukgen_flutter_v1/model/review/date_review.dart';
import 'package:mukgen_flutter_v1/model/review/detail_review.dart';
import 'package:mukgen_flutter_v1/model/review/rank_review.dart';
import 'package:mukgen_flutter_v1/model/review/today_review.dart';
import 'package:mukgen_flutter_v1/secret.dart';
import 'package:http/http.dart' as http;

class ReviewService {
  static const _storage = FlutterSecureStorage();
  static const _url = "$baseUrl/review/";

  ReviewService._();

  static Future<DateReview> getDateReviewInfo(String date) async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    final response = await http.get(
      Uri.parse("$_url/date/$date"),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "X-Not-Using-Xquare-Auth": "true",
      },
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return DateReview.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }

  static Future<DetailReview> getDetailReviewInfo(int reviewId) async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    final response = await http.get(
      Uri.parse("$_url/$reviewId"),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "X-Not-Using-Xquare-Auth": "true",
      },
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return DetailReview.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }

  static Future<RankReview> getRankReviewInfo() async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    final response = await http.get(
      Uri.parse("$_url/rank"),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "X-Not-Using-Xquare-Auth": "true",
      },
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return RankReview.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }

  static Future<TodayReview> getTodayReviewInfo() async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    final response = await http.get(
      Uri.parse("$_url/today"),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "X-Not-Using-Xquare-Auth": "true",
      },
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return TodayReview.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }
}
