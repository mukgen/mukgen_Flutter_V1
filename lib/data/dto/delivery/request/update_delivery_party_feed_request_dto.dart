import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';

final class UpdateDeliveryPartyFeedRequestDTO extends BaseRequestDTO {
  final int tip, phoneNumber, userId;
  final String description, restaurant;

  UpdateDeliveryPartyFeedRequestDTO({
    required this.tip,
    required this.phoneNumber,
    required this.userId,
    required this.description,
    required this.restaurant,
  });

  @override
  Map<String, dynamic> toJson() => {
        'tip': tip,
        'phonenumber': phoneNumber,
        'userId': userId,
        'description': description,
        'restaurant': restaurant,
      };
}
