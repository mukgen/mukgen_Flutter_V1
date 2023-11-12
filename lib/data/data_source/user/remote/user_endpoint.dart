import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/core/network/http_method.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_endpoint.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_rest_api_domain.dart';
import 'package:mukgen_flutter_v1/data/dto/user/request/upload_user_profile_request_dto.dart';

sealed class UserEndpoint extends MukgenEndpoint {
  UserEndpoint();

  factory UserEndpoint.readUserProfile() = ReadUserProfile;

  factory UserEndpoint.uploadUserProfileImage(
          {UploadUserProfileRequestDTO uploadUserProfileRequestDTO}) =
      UploadUserProfileImage;

  @override
  BaseRequestDTO? get body => switch (this) {
        ReadUserProfile() => null,
        UploadUserProfileImage(
          uploadUserProfileRequestDTO: final uploadUserProfileBody
        ) =>
          uploadUserProfileBody,
      };

  @override
  MukgenRestAPIDomain get domain => MukgenRestAPIDomain.user;

  @override
  Map<int, Exception> get errorMap => throw UnimplementedError();

  @override
  HTTPMethod get httpMethod => switch (this) {
        ReadUserProfile() => HTTPMethod.get,
        UploadUserProfileImage() => HTTPMethod.post,
      };

  @override
  JwtTokenType get jwtTokenType => switch (this) {
        ReadUserProfile() => JwtTokenType.accessToken,
        UploadUserProfileImage() => JwtTokenType.accessToken,
      };

  @override
  String get path => switch (this) {
        ReadUserProfile() => "/user/profile",
        UploadUserProfileImage() => "/user/profile/upload?",
      };

  @override
  Map<String, dynamic>? get queryParam => switch (this) {
        ReadUserProfile() => null,
        UploadUserProfileImage() => null,
      };
}

//Xfile을 formdata로 바꿔주는 과정이 usecase에 있어야 할듯
final class ReadUserProfile extends UserEndpoint {}

final class UploadUserProfileImage extends UserEndpoint {
  final UploadUserProfileRequestDTO? uploadUserProfileRequestDTO;

  UploadUserProfileImage({this.uploadUserProfileRequestDTO});
}
