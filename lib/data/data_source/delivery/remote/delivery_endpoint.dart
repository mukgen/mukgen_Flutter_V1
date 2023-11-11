import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/core/network/http_method.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_endpoint.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_rest_api_domain.dart';
import 'package:mukgen_flutter_v1/data/dto/delivery/request/create_delivery_party_feed_request_dto.dart';

sealed class DeliveryEndpoint extends MukgenEndpoint {
  DeliveryEndpoint();

  factory DeliveryEndpoint.createDeliveryPartyFeed(
      {required CreateDeliveryPartyFeedRequestDTO
          createDeliveryPartyFeedRequestDTO}) = CreateDeliveryPartyFeed;

  factory DeliveryEndpoint.readAllDeliveryPartyFeed() =
      ReadAllDeliveryPartyFeed;

  @override
  BaseRequestDTO? get body => switch (this) {
        CreateDeliveryPartyFeed(
          createDeliveryPartyFeedRequestDTO: final createDeliveryPartyFeedBody
        ) =>
          createDeliveryPartyFeedBody,
        ReadAllDeliveryPartyFeed() => null,
      };

  @override
  MukgenRestAPIDomain get domain => MukgenRestAPIDomain.delivery;

  @override
  Map<int, Exception> get errorMap => throw UnimplementedError();

  @override
  HTTPMethod get httpMethod => switch (this) {
        CreateDeliveryPartyFeed() => HTTPMethod.post,
        ReadAllDeliveryPartyFeed() => HTTPMethod.get,
      };

  @override
  JwtTokenType get jwtTokenType => switch (this) {
        CreateDeliveryPartyFeed() => JwtTokenType.accessToken,
        ReadAllDeliveryPartyFeed() => JwtTokenType.accessToken,
      };

  @override
  String get path => switch (this) {
        CreateDeliveryPartyFeed() => "/delivery-party",
        ReadAllDeliveryPartyFeed() => "/delivery-party/list",
      };

  @override
  Map<String, dynamic>? get queryParam => switch (this) {
        CreateDeliveryPartyFeed() => null,
        ReadAllDeliveryPartyFeed() => null,
      };
}

final class CreateDeliveryPartyFeed extends DeliveryEndpoint {
  final CreateDeliveryPartyFeedRequestDTO createDeliveryPartyFeedRequestDTO;

  CreateDeliveryPartyFeed({required this.createDeliveryPartyFeedRequestDTO});
}

final class ReadAllDeliveryPartyFeed extends DeliveryEndpoint {}
