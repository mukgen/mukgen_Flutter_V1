import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mukgen_flutter_v1/core/jwt_store/jwt_store.dart';
import 'package:mukgen_flutter_v1/core/jwt_store/jwt_store_properties.dart';

class JwtStoreImpl implements JwtStore {
  final FlutterSecureStorage _storage;

  JwtStoreImpl({required FlutterSecureStorage storage}) : _storage = storage;

  @override
  Future<void> save(
          {required JwtStoreProperties properties,
          required String value}) async =>
      await _storage.write(key: properties.name, value: value);

  @override
  Future<String> load({required JwtStoreProperties properties}) async =>
      await _storage.read(key: properties.name) ?? "";

  @override
  Future<void> delete(JwtStoreProperties properties) async {
    await _storage.delete(key: properties.name);
  }
}
