import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/core/network/networking_provider.dart';
import 'package:mukgen_flutter_v1/data/data_source/meal_suggestion/remote/remote_meal_suggestion_data_source.dart';

final remoteMealSuggestionDataSourceProvider = Provider((ref) =>
    RemoteMealSuggestionDataSource(networking: ref.watch(networkingProvider)));
