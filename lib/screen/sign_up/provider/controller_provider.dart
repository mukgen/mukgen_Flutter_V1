import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerProvider = StateProvider.autoDispose<bool>((ref) => false);