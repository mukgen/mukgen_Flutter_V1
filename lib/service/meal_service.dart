import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mukgen_flutter_v1/model/meal/mukgen_pick.dart';
import 'package:mukgen_flutter_v1/model/meal/today_meal.dart';
import 'package:mukgen_flutter_v1/secret.dart';
import 'package:http/http.dart' as http;

class MealService {
  static const _storage = FlutterSecureStorage();
  static const _url = "$baseUrl/meal";

  MealService._();

  static Future<MukGenPickBoard> getMukGenPickInfo() async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    final response = await http.get(
      Uri.parse("$baseUrl/mukgen-pick"),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "X-Not-Using-Xquare-Auth": "true"
      },
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return MukGenPickBoard.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)));
  }

  static Future<TodayMeal> getTodayMealInfo() async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    final response = await http.get(
      Uri.parse("$_url/today"),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "X-Not-Using-Xquare-Auth": "true"
      },
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return TodayMeal.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }
}
