import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/core/network/networking_provider.dart';
import 'package:mukgen_flutter_v1/data/data_source/meal/remote/remote_meal_data_source.dart';

final remoteMealDataSourceProvider = Provider((ref) => RemoteMealDataSource(networking: ref.watch(networkingProvider)));