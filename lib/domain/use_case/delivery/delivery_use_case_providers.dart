import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/domain/repository/delivery/delivery_repository_provider.dart';
import 'package:mukgen_flutter_v1/domain/use_case/delivery/create_delivery_party_feed_use_case.dart';
import 'package:mukgen_flutter_v1/domain/use_case/delivery/delete_delivery_party_feed_use_case.dart';
import 'package:mukgen_flutter_v1/domain/use_case/delivery/join_delivery_party_use_case.dart';
import 'package:mukgen_flutter_v1/domain/use_case/delivery/leave_delivery_party_use_case.dart';
import 'package:mukgen_flutter_v1/domain/use_case/delivery/read_all_delivery_party_feed_use_case.dart';
import 'package:mukgen_flutter_v1/domain/use_case/delivery/update_delivery_party_feed_use_case.dart';

final createDeliveryPartyUseCaseProvider =
    Provider<CreateDeliveryPartyFeedUseCase>((ref) =>
        CreateDeliveryPartyFeedUseCase(
            deliveryRepository: ref.watch(deliveryRepositoryProvider)));

final deleteDeliveryPartyFeedUseCaseProvider =
    Provider<DeleteDeliveryPartyFeedUseCase>((ref) =>
        DeleteDeliveryPartyFeedUseCase(
            deliveryRepository: ref.watch(deliveryRepositoryProvider)));

final joinDeliveryPartyUseCaseProvider = Provider<JoinDeliveryPartyUseCase>(
    (ref) => JoinDeliveryPartyUseCase(
        deliveryRepository: ref.watch(deliveryRepositoryProvider)));

final leaveDeliveryPartyUseCaseProvider = Provider<LeaveDeliveryPartyUseCase>(
    (ref) => LeaveDeliveryPartyUseCase(
        deliveryRepository: ref.watch(deliveryRepositoryProvider)));

final readAllDeliveryPartyFeedUseCaseProvider =
    Provider<ReadAllDeliveryPartyFeedUseCase>((ref) =>
        ReadAllDeliveryPartyFeedUseCase(
            deliveryRepository: ref.watch(deliveryRepositoryProvider)));

final updateDeliveryPartyFeedUseCaseProvider =
    Provider<UpdateDeliveryPartyFeedUseCase>((ref) =>
        UpdateDeliveryPartyFeedUseCase(
            deliveryRepository: ref.watch(deliveryRepositoryProvider)));
