import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/auth/jwt_token_entity.dart';

final class ReIssueResponseDTO extends BaseResponseDTO<JWTTokenEntity> {
  late final String accessToken, refreshToken;

  ReIssueResponseDTO();

  factory ReIssueResponseDTO.fromJson(Map<String, dynamic> json) =>
      ReIssueResponseDTO()
        ..accessToken = json['accessToken']
        ..refreshToken = json['refreshToken'];

  @override
  fromJson(Map<String, dynamic> json) => ReIssueResponseDTO.fromJson(json);

  @override
  JWTTokenEntity toEntity() => JWTTokenEntity(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
}
