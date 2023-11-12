import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/core/network/http_method.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_endpoint.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_rest_api_domain.dart';

sealed class UserEndpoint extends MukgenEndpoint {
  UserEndpoint();

  factory UserEndpoint.readUserProfile() = ReadUserProfile;

  @override
  BaseRequestDTO? get body => switch (this) {
        ReadUserProfile() => null,
      };

  @override
  MukgenRestAPIDomain get domain => MukgenRestAPIDomain.user;

  @override
  Map<int, Exception> get errorMap => throw UnimplementedError();

  @override
  HTTPMethod get httpMethod => switch (this) {
        ReadUserProfile() => HTTPMethod.get,
      };

  @override
  JwtTokenType get jwtTokenType => switch (this) {
        ReadUserProfile() => JwtTokenType.accessToken,
      };

  @override
  String get path => switch (this) {
        ReadUserProfile() => "/user/profile",
      };

  @override
  Map<String, dynamic>? get queryParam => switch (this) {
        ReadUserProfile() => null,
      };
}

final class ReadUserProfile extends UserEndpoint {}
