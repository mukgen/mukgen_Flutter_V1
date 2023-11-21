import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/user/user_profile_entity.dart';

final class ReadUserProfileResponseDTO
    extends BaseResponseDTO<UserProfileEntity> {
  late final String accountId, nickname, phoneNumber, mail;
  late String? profileUrl;

  ReadUserProfileResponseDTO();

  factory ReadUserProfileResponseDTO.fromJson(Map<String, dynamic> json) =>
      ReadUserProfileResponseDTO()
        ..accountId = json['accountId']
        ..nickname = json['nickname']
        ..phoneNumber = json['phoneNumber']
        ..mail = json['mail']
        ..profileUrl = json['profileUrl'];

  @override
  fromJson(Map<String, dynamic> json) =>
      ReadUserProfileResponseDTO.fromJson(json);

  @override
  UserProfileEntity toEntity() => UserProfileEntity(
        accountId: accountId,
        nickname: nickname,
        phoneNumber: phoneNumber,
        mail: mail,
        profileUrl: profileUrl ?? "",
      );
}
