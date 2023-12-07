import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/domain/entity/meal_suggestion/meal_suggestion_entity.dart';
import 'package:mukgen_flutter_v1/domain/repository/meal_suggestion/meal_suggestion_repository.dart';

class ReadAllMealSuggestionUseCase {
  final MealSuggestionRepository _mealSuggestionRepository;

  ReadAllMealSuggestionUseCase(
      {required MealSuggestionRepository mealSuggestionRepository})
      : _mealSuggestionRepository = mealSuggestionRepository;

  Future<Result<List<MealSuggestionEntity>, Exception>> execute() =>
      _mealSuggestionRepository.readAllMealSuggestion();
}
