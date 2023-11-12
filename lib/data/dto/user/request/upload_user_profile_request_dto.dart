import 'package:dio/dio.dart';
import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';

final class UploadUserProfileRequestDTO extends BaseRequestDTO {
  final FormData images;

  UploadUserProfileRequestDTO({required this.images});

  @override
  Map<String, dynamic> toJson() => {'images': images};
}
