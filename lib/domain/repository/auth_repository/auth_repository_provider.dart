import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/data/data_source/auth/local_auth_data_source_provider.dart';
import 'package:mukgen_flutter_v1/data/data_source/auth/remote/remote_auth_data_source_provider.dart';
import 'package:mukgen_flutter_v1/data/repository/auth_repository_impl.dart';
import 'package:mukgen_flutter_v1/domain/repository/auth_repository/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) {
    final remoteAuthDataSource = ref.watch(remoteAuthDataSourceProvider);
    final localAuthDataSource = ref.watch(localAuthDataSourceProvider);
    return AuthRepositoryImpl(
        remoteAuthDataSource: remoteAuthDataSource,
        localAuthDataSource: localAuthDataSource);
  },
);
