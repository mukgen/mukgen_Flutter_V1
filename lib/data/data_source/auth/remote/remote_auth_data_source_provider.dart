import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/core/network/networking_provider.dart';
import 'package:mukgen_flutter_v1/data/data_source/auth/remote/remote_auth_data_source.dart';

final remoteAuthDataSourceProvider = Provider(
    (ref) => RemoteAuthDataSource(networking: ref.watch(networkingProvider)));
