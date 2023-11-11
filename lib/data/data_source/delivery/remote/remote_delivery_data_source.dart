import 'package:mukgen_flutter_v1/core/network/networking.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/data_source/delivery/remote/delivery_endpoint.dart';
import 'package:mukgen_flutter_v1/data/dto/delivery/request/create_delivery_party_feed_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/delivery/request/update_delivery_party_feed_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/delivery/response/read_all_delivery_party_feed_response_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/delivery/delivery_party_info_entity.dart';

class RemoteDeliveryDataSource {
  final Networking _networking;

  RemoteDeliveryDataSource({required Networking networking})
      : _networking = networking;

  Future<Result<void, Exception>> createDeliveryPartyFeed(
          {required CreateDeliveryPartyFeedRequestDTO
              createDeliveryPartyFeedRequestDTO}) async =>
      await _networking.noResponseRequest(
        endpoint: DeliveryEndpoint.createDeliveryPartyFeed(
          createDeliveryPartyFeedRequestDTO: createDeliveryPartyFeedRequestDTO,
        ),
      );

  Future<Result<List<DeliveryPartyInfoEntity>, Exception>>
      readAllDeliveryPartyFeed() async {
    final res = await _networking.request<ReadAllDeliveryPartyFeedResponseDTO,
            ReadAllDeliveryPartyFeedResponseDTO>(
        endpoint: DeliveryEndpoint.readAllDeliveryPartyFeed(),
        responseType: ReadAllDeliveryPartyFeedResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }

  Future<Result<void, Exception>> joinDeliveryParty(
          {required int deliveryId}) async =>
      await _networking.noResponseRequest(
          endpoint: DeliveryEndpoint.joinDeliveryParty(
        deliveryId: deliveryId,
      ));

  Future<Result<void, Exception>> leaveDeliveryParty(
          {required int deliveryId}) async =>
      await _networking.noResponseRequest(
          endpoint: DeliveryEndpoint.leaveDeliveryParty(
        deliveryId: deliveryId,
      ));

  Future<Result<void, Exception>> deleteDeliveryPartyFeed(
          {required int deliveryId}) async =>
      await _networking.noResponseRequest(
          endpoint: DeliveryEndpoint.deleteDeliveryPartyFeed(
        deliveryId: deliveryId,
      ));

  Future<Result<void, Exception>> updateDeliveryPartyFeed(
          {required int deliveryId,
          required UpdateDeliveryPartyFeedRequestDTO
              updateDeliveryPartyFeedRequestDTO}) async =>
      await _networking.noResponseRequest(
          endpoint: DeliveryEndpoint.updateDeliveryPartyFeed(
        deliveryId: deliveryId,
        updateDeliveryPartyFeedRequestDTO: updateDeliveryPartyFeedRequestDTO,
      ));
}
