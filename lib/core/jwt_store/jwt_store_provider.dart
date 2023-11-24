import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mukgen_flutter_v1/core/jwt_store/jwt_store.dart';
import 'package:mukgen_flutter_v1/core/jwt_store/jwt_store_impl.dart';

final jwtStoreProvider = Provider<JwtStore>((ref) {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  return JwtStoreImpl(storage: storage);
});
