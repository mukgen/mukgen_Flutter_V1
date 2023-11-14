import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/user/user_profile_url_entity.dart';

final class UploadUserProfileImageResponseDTO
    extends BaseResponseDTO<UserProfileUrlEntity> {
  late final String profileUrl;

  UploadUserProfileImageResponseDTO();

  factory UploadUserProfileImageResponseDTO.fromJson(
          Map<String, dynamic> json) =>
      UploadUserProfileImageResponseDTO()..profileUrl = json['images'];

  @override
  fromJson(Map<String, dynamic> json) =>
      UploadUserProfileImageResponseDTO.fromJson(json);

  @override
  UserProfileUrlEntity toEntity() =>
      UserProfileUrlEntity(profileUrl: profileUrl);
}
