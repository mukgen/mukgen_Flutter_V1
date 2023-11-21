import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/core/network/interceptor.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_endpoint.dart';
import 'package:mukgen_flutter_v1/core/network/network_decoder.dart';
import 'package:mukgen_flutter_v1/core/network/network_request.dart';
import 'package:mukgen_flutter_v1/core/network/networking.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart';

class NetworkingImpl implements Networking {
  List<Interceptor> interceptor = List.empty(growable: true);

  @override
  Future<Result<K, Exception>> request<T extends BaseResponseDTO, K>(
      {required MukgenEndpoint endpoint, required T responseType}) async {
    try {
      for (var e in interceptor) {
        await e.onRequest(endpoint);
      }
      final response = await NetworkRequest.network.request(options: endpoint);
      for (var e in interceptor) {
        await e.onResponse(endpoint, response);
      }
      final decodeData = NetworkDecoder.decodeHelper.decode<T, K>(
        response: response,
        responseType: responseType,
      );
      return Success(value: decodeData);
    } catch (error) {
      for (var e in interceptor) {
        await e.onError(error);
      }
      return Failure(exception: Exception(error));
    }
  }

  @override
  Future<Result<void, Exception>> noResponseRequest(
      {required MukgenEndpoint endpoint}) async {
    try {
      for (var e in interceptor) {
        await e.onRequest(endpoint);
      }
      final response = await NetworkRequest.network.request(options: endpoint);
      for (var e in interceptor) {
        await e.onResponse(endpoint, response);
      }
      return const Success(value: null);
    } catch (error) {
      for (var e in interceptor) {
        await e.onError(error);
      }
      return Failure(exception: Exception(error));
    }
  }
}
