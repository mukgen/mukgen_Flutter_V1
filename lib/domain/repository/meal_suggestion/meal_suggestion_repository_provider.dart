import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/data/data_source/meal_suggestion/remote/remote_meal_suggestion_data_source_provider.dart';
import 'package:mukgen_flutter_v1/data/repository/meal_suggestion_repository_impl.dart';
import 'package:mukgen_flutter_v1/domain/repository/meal_suggestion/meal_suggestion_repository.dart';

final mealSuggestionRepositoryProvider =
    Provider<MealSuggestionRepository>((ref) {
  final remoteMealSuggestionDataSource =
      ref.watch(remoteMealSuggestionDataSourceProvider);
  return MealSuggestionRepositoryImpl(
      remoteMealSuggestionDataSource: remoteMealSuggestionDataSource);
});
