import 'package:mukgen_flutter_v1/core/jwt_store/jwt_store_properties.dart';

abstract interface class JwtStore {
  Future<void> save(
      {required JwtStoreProperties properties, required String value});

  Future<String> load({required JwtStoreProperties properties});

  Future<void> delete(JwtStoreProperties properties);
}
