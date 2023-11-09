import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_endpoint.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart';

abstract class Networking {
  Future<Result<K, Exception>> request<T extends BaseResponseDTO, K>(
      {required MukgenEndpoint endpoint, required T responseType});

  Future<Result<void, Exception>> noResponseRequest(
      {required MukgenEndpoint endpoint});
}
