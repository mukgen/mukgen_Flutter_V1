import 'package:mukgen_flutter_v1/domain/entity/meal_suggestion/meal_suggestion_entity.dart';

sealed class MealSuggestionPageState {
  MealSuggestionPageState();

  factory MealSuggestionPageState.initial() = Initial;

  factory MealSuggestionPageState.loading() = Loading;

  factory MealSuggestionPageState.failure({required String errorMessage}) =
      Failure;

  factory MealSuggestionPageState.success(
      {required List<MealSuggestionEntity> mealSuggestions}) = Success;
}

final class Initial extends MealSuggestionPageState {}

final class Loading extends MealSuggestionPageState {}

final class Failure extends MealSuggestionPageState {
  final String errorMessage;

  Failure({required this.errorMessage});
}

final class Success extends MealSuggestionPageState {
  final List<MealSuggestionEntity> mealSuggestions;

  Success({required this.mealSuggestions});
}
