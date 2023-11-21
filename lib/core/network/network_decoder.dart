import 'package:dio/dio.dart';
import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';

class NetworkDecoder {
  static var decodeHelper = NetworkDecoder();

  K decode<T extends BaseResponseDTO, K>(
      {required Response<dynamic> response, required T responseType}) {
    try {
      if (response.data is List) {
        return List<T>.from((response.data as List)
            .map((item) => responseType.fromJson(item))
            .toList()) as K;
      } else {
        return responseType.fromJson(response.data) as K;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
