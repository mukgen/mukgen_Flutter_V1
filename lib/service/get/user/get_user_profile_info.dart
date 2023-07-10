import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/model/user/profile_user.dart';
import 'package:mukgen_flutter_v1/secret.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<UserProfile> getUserProfileInfo() async {
  const storage = FlutterSecureStorage();
  dynamic accessToken = await storage.read(key: 'accessToken');
  final response = await http.get(
    Uri.parse("$baseUrl/user/profile"),
    headers: <String, String>{"Authorization": "Bearer $accessToken"},
  );
  if (response.statusCode == 200) {
    return UserProfile.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    throw Exception(response.body);
  }
}