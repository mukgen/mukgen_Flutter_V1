import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/auth/jwt_token_entity.dart';

final class SignInResponseDTO extends BaseResponseDTO<JWTTokenEntity> {
  late final String message, accessToken, refreshToken;

  SignInResponseDTO();

  factory SignInResponseDTO.fromJson(Map<String, dynamic> json) =>
      SignInResponseDTO()
        ..message = json['message']
        ..accessToken = json['tokenResponse']['accessToken']
        ..refreshToken = json['tokenResponse']['refreshToken'];

  @override
  fromJson(Map<String, dynamic> json) => SignInResponseDTO.fromJson(json);

  @override
  JWTTokenEntity toEntity() => JWTTokenEntity(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
}
