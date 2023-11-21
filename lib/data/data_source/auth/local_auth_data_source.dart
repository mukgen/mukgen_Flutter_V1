import 'package:mukgen_flutter_v1/core/jwt_store/jwt_store.dart';
import 'package:mukgen_flutter_v1/core/jwt_store/jwt_store_properties.dart';
import 'package:mukgen_flutter_v1/domain/entity/auth/jwt_token_entity.dart';

class LocalAuthDataSource {
  final JwtStore _jwtStore;

  LocalAuthDataSource({required JwtStore jwtStore}) : _jwtStore = jwtStore;

  Future<void> tokenSave({required JWTTokenEntity jwtTokenEntity}) async {
    await _jwtStore.save(
        properties: JwtStoreProperties.accessToken,
        value: jwtTokenEntity.accessToken);
    await _jwtStore.save(
        properties: JwtStoreProperties.refreshToken,
        value: jwtTokenEntity.refreshToken);
  }

  Future<void> logOut() async {
    await _jwtStore.delete(JwtStoreProperties.accessToken);
    await _jwtStore.delete(JwtStoreProperties.refreshToken);
  }
}
