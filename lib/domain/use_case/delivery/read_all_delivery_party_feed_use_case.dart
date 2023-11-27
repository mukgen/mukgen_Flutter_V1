import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/domain/entity/delivery/delivery_party_info_entity.dart';
import 'package:mukgen_flutter_v1/domain/repository/delivery_repository.dart';

class ReadAllDeliveryPartyFeedUseCase {
  final DeliveryRepository _deliveryRepository;

  ReadAllDeliveryPartyFeedUseCase(
      {required DeliveryRepository deliveryRepository})
      : _deliveryRepository = deliveryRepository;

  Future<Result<List<DeliveryPartyInfoEntity>, Exception>> execute() =>
      _deliveryRepository.readAllDeliveryPartyFeed();
}
