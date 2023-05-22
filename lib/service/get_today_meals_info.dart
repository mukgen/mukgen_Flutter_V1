import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/model/meal/today_meal.dart';
import 'package:mukgen_flutter_v1/secret.dart';

Future<TodayMeal> getTodayMealInfo() async {
  final response = await http.get(
    Uri.parse("$baseUrl/meal/today"),
    headers: <String, String>{"Authorization": token},
  );
  if (response.statusCode == 200) {
    print(response.body);
    return TodayMeal.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}
