import 'package:dio/dio.dart' hide RequestOptions;
import 'package:mukgen_flutter_v1/core/network/request_options.dart';

abstract class Interceptor<T extends RequestOptions> {
  Future<void> onRequest(T endpoint) async {}

  Future<void> onResponse(T endpoint, Response<dynamic> response) async {}

  Future<void> onError(Object error) async {}
}
