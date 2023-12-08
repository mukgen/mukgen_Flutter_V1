import 'package:mukgen_flutter_v1/core/network/mukgen_rest_api_domain.dart';
import 'package:mukgen_flutter_v1/core/network/request_options.dart';
import 'package:mukgen_flutter_v1/secret.dart' as s;

abstract class MukgenEndpoint extends RequestOptions {
  String get path;

  MukgenRestAPIDomain get domain;

  Map<int, Exception> get errorMap;

  JwtTokenType get jwtTokenType;

  @override
  String get baseUrl => "${s.baseUrl}/$path";

  @override
  Map<String, dynamic> headers = {
    'Content-Type': 'application/json',
    'X-Not-Using-Xquare-Auth': true,
  };
}

enum JwtTokenType { accessToken, refreshToken, none }
