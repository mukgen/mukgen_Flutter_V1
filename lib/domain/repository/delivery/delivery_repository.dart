import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/delivery/request/create_delivery_party_feed_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/delivery/request/update_delivery_party_feed_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/delivery/delivery_party_info_entity.dart';

abstract class DeliveryRepository {
  Future<Result<void, Exception>> createDeliveryPartyFeed(
      {required CreateDeliveryPartyFeedRequestDTO
          createDeliveryPartyFeedRequestDTO});

  Future<Result<List<DeliveryPartyInfoEntity>, Exception>>
      readAllDeliveryPartyFeed();

  Future<Result<void, Exception>> joinDeliveryParty({required int deliveryId});

  Future<Result<void, Exception>> leaveDeliveryParty({required int deliveryId});

  Future<Result<void, Exception>> deleteDeliveryPartyFeed(
      {required int deliveryId});

  Future<Result<void, Exception>> updateDeliveryPartyFeed(
      {required int deliveryId,
      required UpdateDeliveryPartyFeedRequestDTO
          updateDeliveryPartyFeedRequestDTO});
}
