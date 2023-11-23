import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/core/network/networking.dart';
import 'package:mukgen_flutter_v1/core/network/networking_impl.dart';

final networkingProvider = Provider<Networking>((ref) => NetworkingImpl());
