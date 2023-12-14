import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/core/network/http_method.dart';

abstract class RequestOptions {
  String get baseUrl;

  HTTPMethod get httpMethod;

  Map<String, dynamic>? get queryParam;

  BaseRequestDTO? get body;

  Map<String, dynamic> headers = {};
}
