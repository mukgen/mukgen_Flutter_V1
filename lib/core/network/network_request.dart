import 'package:dio/dio.dart' as d;
import 'package:mukgen_flutter_v1/core/network/request_options.dart';

class NetworkRequest {
  static final network = NetworkRequest();
  final d.Dio _client = d.Dio();

  Future<d.Response> request({required RequestOptions options}) {
    return _client.fetch(d.RequestOptions(
      baseUrl: options.baseUrl,
      method: options.httpMethod.name,
      data: options.body?.toJson(),
      headers: options.headers,
      queryParameters: options.queryParam,
      sendTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
    ));
  }
}
