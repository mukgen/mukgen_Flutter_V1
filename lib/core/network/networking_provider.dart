import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/core/jwt_store/jwt_store_provider.dart';
import 'package:mukgen_flutter_v1/core/network/jwt_interceptor.dart';
import 'package:mukgen_flutter_v1/core/network/networking.dart';
import 'package:mukgen_flutter_v1/core/network/networking_impl.dart';

final networkingProvider = Provider<Networking>((ref) => NetworkingImpl()
  ..interceptor.add(JwtInterceptor(jwtStore: ref.watch(jwtStoreProvider))));
