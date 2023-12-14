import 'package:mukgen_flutter_v1/core/jwt_store/jwt_store.dart';
import 'package:mukgen_flutter_v1/core/jwt_store/jwt_store_properties.dart';
import 'package:mukgen_flutter_v1/core/network/interceptor.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_endpoint.dart';

class JwtInterceptor extends Interceptor<MukgenEndpoint> {
  final JwtStore _jwtStore;

  JwtInterceptor({required JwtStore jwtStore}) : _jwtStore = jwtStore;

  @override
  Future<void> onRequest(MukgenEndpoint endpoint) async {
    if (endpoint.jwtTokenType == JwtTokenType.accessToken) {
      endpoint.headers['Authorization'] =
          "Bearer ${await _jwtStore.load(properties: JwtStoreProperties.accessToken)}";
    }
  }
}
