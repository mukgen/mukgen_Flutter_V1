import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/core/network/networking_provider.dart';
import 'package:mukgen_flutter_v1/data/data_source/delivery/remote/remote_delivery_data_source.dart';

final remoteDeliveryDataSourceProvider = Provider((ref) =>
    RemoteDeliveryDataSource(networking: ref.watch(networkingProvider)));
