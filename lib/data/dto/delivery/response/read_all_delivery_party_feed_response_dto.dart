import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/delivery/delivery_party_info_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/delivery/delivery_party_user_info_entity.dart';

final class ReadAllDeliveryPartyFeedResponseDTO
    extends BaseResponseDTO<List<DeliveryPartyInfoEntity>> {
  late final List<DeliveryPartyResponse> deliveryPartyResponses;

  ReadAllDeliveryPartyFeedResponseDTO();

  @override
  fromJson(Map<String, dynamic> json) {
    if (json['deliveryPartyResponseList'] != null) {
      deliveryPartyResponses = List.empty(growable: true);
      json['deliveryPartyResponseList'].forEach((data) {
        deliveryPartyResponses.add(DeliveryPartyResponse().fromJson(data));
      });
    }
  }

  @override
  List<DeliveryPartyInfoEntity> toEntity() =>
      deliveryPartyResponses.map((e) => e.toEntity()).toList();
}

final class DeliveryPartyResponse
    extends BaseResponseDTO<DeliveryPartyInfoEntity> {
  late final int deliveryPartyId, participantNumber, curParticipantNumber;
  late final String menu, place, meetTime;
  late final List<UserInfoResponse> userInfoResponses;

  DeliveryPartyResponse();

  @override
  fromJson(Map<String, dynamic> json) {
    deliveryPartyId = json['deliveryPartyId'];
    participantNumber = json['participantNumber'];
    curParticipantNumber = json['curParticipantNumber'];
    menu = json['menu'];
    place = json['place'];
    meetTime = json['meetTime'];
    if (json['userInfoResponseList'] != null) {
      userInfoResponses = List.empty(growable: true);
      json['userInfoResponseList'].forEach((data) {
        userInfoResponses.add(UserInfoResponse.fromJson(data));
      });
    }
  }

  @override
  DeliveryPartyInfoEntity toEntity() => DeliveryPartyInfoEntity(
        deliveryPartyId: deliveryPartyId,
        participantNumber: participantNumber,
        curParticipantNumber: curParticipantNumber,
        menu: menu,
        place: place,
        meetTime: meetTime,
        deliveryPartyUserInfoEntities:
            userInfoResponses.map((e) => e.toEntity()).toList(),
      );
}

final class UserInfoResponse
    extends BaseResponseDTO<DeliveryPartyUserInfoEntity> {
  late final String accountId, nickname, phoneNumber, profileUrl;

  UserInfoResponse();

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      UserInfoResponse()
        ..accountId = json['accountId']
        ..nickname = json['nickname']
        ..phoneNumber = json['phoneNumber']
        ..profileUrl = json['profileUrl'];

  @override
  fromJson(Map<String, dynamic> json) => UserInfoResponse().fromJson(json);

  @override
  DeliveryPartyUserInfoEntity toEntity() => DeliveryPartyUserInfoEntity(
        accountId: accountId,
        nickname: nickname,
        phoneNumber: phoneNumber,
        profileUrl: profileUrl,
      );
}
