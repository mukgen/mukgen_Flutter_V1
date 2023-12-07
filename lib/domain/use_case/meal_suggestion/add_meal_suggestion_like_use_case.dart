import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/domain/repository/meal_suggestion/meal_suggestion_repository.dart';

class AddMealSuggestionLikeUseCase {
  final MealSuggestionRepository _mealSuggestionRepository;

  AddMealSuggestionLikeUseCase(
      {required MealSuggestionRepository mealSuggestionRepository})
      : _mealSuggestionRepository = mealSuggestionRepository;

  Future<Result<void, Exception>> execute({required int mealSuggestionId}) =>
      _mealSuggestionRepository.addMealSuggestionLike(
          mealSuggestionId: mealSuggestionId);
}
