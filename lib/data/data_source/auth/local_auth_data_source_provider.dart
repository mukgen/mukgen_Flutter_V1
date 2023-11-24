import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/core/jwt_store/jwt_store_provider.dart';
import 'package:mukgen_flutter_v1/data/data_source/auth/local_auth_data_source.dart';

final localAuthDataSourceProvider = Provider(
    (ref) => LocalAuthDataSource(jwtStore: ref.watch(jwtStoreProvider)));
