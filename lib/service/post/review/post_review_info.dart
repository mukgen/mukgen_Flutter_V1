import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mukgen_flutter_v1/secret.dart';
import 'package:mukgen_flutter_v1/widget/review/review_posting_image.dart';
import 'package:path/path.dart';

Future<void> postReviewInfo(int count, String review, int riceId) async {
  const storage = FlutterSecureStorage();
  dynamic accessToken = await storage.read(key: 'accessToken');

  final dio = Dio();
  dio.options.headers["Authorization"] = "Bearer $accessToken";
  dio.options.headers["X-Not-Using-Xquare-Auth"] = "true";
  const url = "$baseUrl/user/profile/upload?";
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
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.data);
    } else {
      throw Exception(response.statusMessage);
    }
  } catch (e) {
    print(e);
    throw Exception();
  }
}
