import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/delivery/request/create_delivery_party_feed_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/repository/delivery/delivery_repository.dart';

class CreateDeliveryPartyFeedUseCase {
  final DeliveryRepository _deliveryRepository;

  CreateDeliveryPartyFeedUseCase(
      {required DeliveryRepository deliveryRepository})
      : _deliveryRepository = deliveryRepository;

  Future<Result<void, Exception>> execute(
          {required CreateDeliveryPartyFeedRequestDTO
              createDeliveryPartyFeedRequestDTO}) =>
      _deliveryRepository.createDeliveryPartyFeed(
          createDeliveryPartyFeedRequestDTO: createDeliveryPartyFeedRequestDTO);
}
