import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mukgen_flutter_v1/model/user/profile_upload.dart';
import 'package:mukgen_flutter_v1/secret.dart';
import 'package:path/path.dart';

Future<ProfileUpload> postUploadProfileInfo(XFile imageFile) async {
  const storage = FlutterSecureStorage();
  String? accessToken = await storage.read(key: 'accessToken');

  final dio = Dio();
  dio.options.headers["Authorization"] = "Bearer $accessToken";
  const url = "$baseUrl/user/profile/upload?";
  final fileName = basename(imageFile.path);
  final formData = FormData.fromMap({
    'images': await MultipartFile.fromFile(imageFile.path, filename: fileName),
  });

  try {
    final response = await dio.post(url, data: formData);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.data);
      return ProfileUpload(images: response.data);
    } else {
      throw Exception(response.statusMessage);
    }
  } catch (e) {
    print(e);
    throw Exception();
  }
}