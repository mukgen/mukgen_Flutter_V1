import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';

final class CreateDeliveryPartyFeedRequestDTO extends BaseRequestDTO {
  final int participantNumber;
  final String menu, place, meetTime;

  CreateDeliveryPartyFeedRequestDTO({
    required this.participantNumber,
    required this.meetTime,
    required this.menu,
    required this.place,
  });

  @override
  Map<String, dynamic> toJson() => {
        'participantNumber': participantNumber,
        'menu': menu,
        'place': place,
        'meetTime': meetTime
      };
}
