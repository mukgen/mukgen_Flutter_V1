import 'package:mukgen_flutter_v1/domain/entity/delivery/delivery_party_user_info_entity.dart';

class DeliveryPartyInfoEntity {
  final int deliveryPartyId, participantNumber, curParticipantNumber;
  final String menu, place, meetTime;
  final List<DeliveryPartyUserInfoEntity> deliveryPartyUserInfoEntities;

  DeliveryPartyInfoEntity({
    required this.deliveryPartyId,
    required this.participantNumber,
    required this.curParticipantNumber,
    required this.menu,
    required this.place,
    required this.meetTime,
    required this.deliveryPartyUserInfoEntities,
  });
}
