import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/delivery/request/update_delivery_party_feed_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/repository/delivery/delivery_repository.dart';

class UpdateDeliveryPartyFeedUseCase {
  final DeliveryRepository _deliveryRepository;

  UpdateDeliveryPartyFeedUseCase(
      {required DeliveryRepository deliveryRepository})
      : _deliveryRepository = deliveryRepository;

  Future<Result<void, Exception>> execute(
          {required int deliveryId,
          required UpdateDeliveryPartyFeedRequestDTO
              updateDeliveryPartyFeedRequestDTO}) =>
      _deliveryRepository.updateDeliveryPartyFeed(
          deliveryId: deliveryId,
          updateDeliveryPartyFeedRequestDTO: updateDeliveryPartyFeedRequestDTO);
}
