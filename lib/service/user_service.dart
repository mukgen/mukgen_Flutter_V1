import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mukgen_flutter_v1/model/user/profile_upload.dart';
import 'package:mukgen_flutter_v1/model/user/profile_user.dart';
import 'package:mukgen_flutter_v1/secret.dart';
import 'package:mukgen_flutter_v1/widget/review/review_posting_image.dart';
import 'package:path/path.dart';

class SuggestionService {
  static const _storage = FlutterSecureStorage();
  static const _url = "$baseUrl/user";

  static Future<ProfileUser> getUserProfileInfo() async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    final response = await http.get(
      Uri.parse("$_url/profile"),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "X-Not-Using-Xquare-Auth": "true",
      },
    );
    if (response.statusCode == 200) {
      return ProfileUser.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception(response.body);
    }
  }

  static Future<ProfileUpload> postUploadProfileInfo(XFile imageFile) async {
    dynamic accessToken = await _storage.read(key: 'accessToken');

    final dio = Dio();
    dio.options.headers["Authorization"] = "Bearer $accessToken";
    dio.options.headers["X-Not-Using-Xquare-Auth"] = "true";
    const url = "$_url/profile/upload?";
    final fileName = basename(ReviewPostingImage.image!.path);
    final formData = FormData.fromMap({
      'images': await MultipartFile.fromFile(ReviewPostingImage.image!.path,
          filename: fileName),
    });

    final Response response;

    try {
      if (ReviewPostingImage.image != null) {
        response = await dio.post(url, data: formData);
      } else {
        response = await dio.post(url);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ProfileUpload.fromJson(jsonDecode(response.data));
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception();
    }
  }
}
