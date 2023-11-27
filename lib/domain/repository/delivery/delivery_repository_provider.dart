import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/data/data_source/delivery/remote/remote_delivery_repository_provider.dart';
import 'package:mukgen_flutter_v1/data/repository/delivery_repository_impl.dart';
import 'package:mukgen_flutter_v1/domain/repository/delivery/delivery_repository.dart';

final deliveryRepositoryProvider = Provider<DeliveryRepository>(
  (ref) {
    final remoteDeliveryDataSource =
        ref.watch(remoteDeliveryDataSourceProvider);
    return DeliveryRepositoryImpl(
        remoteDeliveryDataSource: remoteDeliveryDataSource);
  },
);
