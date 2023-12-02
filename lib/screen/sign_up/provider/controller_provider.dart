import 'package:flutter_riverpod/flutter_riverpod.dart';

// name page에서 사용되는 provider
final nameButtonProvider = StateProvider.autoDispose<bool>((ref) => false);

// number page에서 사용되는 provider
final numberButtonProvider = StateProvider.autoDispose<bool>((ref) => false);