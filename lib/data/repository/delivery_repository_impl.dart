import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/data_source/delivery/remote/remote_delivery_data_source.dart';
import 'package:mukgen_flutter_v1/data/dto/delivery/request/create_delivery_party_feed_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/delivery/request/update_delivery_party_feed_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/delivery/delivery_party_info_entity.dart';
import 'package:mukgen_flutter_v1/domain/repository/delivery_repository.dart';

class DeliveryRepositoryImpl extends DeliveryRepository {
  final RemoteDeliveryDataSource _remoteDeliveryDataSource;

  DeliveryRepositoryImpl(
      {required RemoteDeliveryDataSource remoteDeliveryDataSource})
      : _remoteDeliveryDataSource = remoteDeliveryDataSource;

  @override
  Future<Result<void, Exception>> createDeliveryPartyFeed(
          {required CreateDeliveryPartyFeedRequestDTO
              createDeliveryPartyFeedRequestDTO}) =>
      _remoteDeliveryDataSource.createDeliveryPartyFeed(
          createDeliveryPartyFeedRequestDTO: createDeliveryPartyFeedRequestDTO);

  @override
  Future<Result<void, Exception>> deleteDeliveryPartyFeed(
          {required int deliveryId}) =>
      _remoteDeliveryDataSource.deleteDeliveryPartyFeed(deliveryId: deliveryId);

  @override
  Future<Result<void, Exception>> joinDeliveryParty(
          {required int deliveryId}) =>
      _remoteDeliveryDataSource.joinDeliveryParty(deliveryId: deliveryId);

  @override
  Future<Result<void, Exception>> leaveDeliveryParty(
          {required int deliveryId}) =>
      _remoteDeliveryDataSource.leaveDeliveryParty(deliveryId: deliveryId);

  @override
  Future<Result<List<DeliveryPartyInfoEntity>, Exception>>
      readAllDeliveryPartyFeed() =>
          _remoteDeliveryDataSource.readAllDeliveryPartyFeed();

  @override
  Future<Result<void, Exception>> updateDeliveryPartyFeed(
          {required int deliveryId,
          required UpdateDeliveryPartyFeedRequestDTO
              updateDeliveryPartyFeedRequestDTO}) =>
      _remoteDeliveryDataSource.updateDeliveryPartyFeed(
          deliveryId: deliveryId,
          updateDeliveryPartyFeedRequestDTO: updateDeliveryPartyFeedRequestDTO);
}
