import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/domain/repository/delivery/delivery_repository.dart';

class LeaveDeliveryPartyUseCase {
  final DeliveryRepository _deliveryRepository;

  LeaveDeliveryPartyUseCase({required DeliveryRepository deliveryRepository})
      : _deliveryRepository = deliveryRepository;

  Future<Result<void, Exception>> execute({required int deliveryId}) =>
      _deliveryRepository.leaveDeliveryParty(deliveryId: deliveryId);
}
