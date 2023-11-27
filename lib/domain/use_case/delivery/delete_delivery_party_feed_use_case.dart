import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/domain/repository/delivery_repository.dart';

class DeleteDeliveryPartyFeedUseCase {
  final DeliveryRepository _deliveryRepository;

  DeleteDeliveryPartyFeedUseCase(
      {required DeliveryRepository deliveryRepository})
      : _deliveryRepository = deliveryRepository;

  Future<Result<void, Exception>> execute({required int deliveryId}) =>
      _deliveryRepository.deleteDeliveryPartyFeed(deliveryId: deliveryId);
}
