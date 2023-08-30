import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/secret.dart';

Future<void> postDislikeSuggestionInfo(int mealSuggestionId) async {
  const storage = FlutterSecureStorage();
  dynamic accessToken = await storage.read(key: 'accessToken');
  final response = await http.post(
    Uri.parse("$baseUrl/meal-suggestion/dislike/$mealSuggestionId"),
    headers: <String, String>{
      "Authorization": "Bearer $accessToken",
      "X-Not-Using-Xquare-Auth": "true",
    },
  );
  if (response.statusCode == 201) {
    print('성공');
  } else {
    throw Exception(response.body);
  }
}
