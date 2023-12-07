import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/meal_suggestion/request/update_meal_suggestion_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/repository/meal_suggestion/meal_suggestion_repository.dart';

class UpdateMealSuggestionUseCase {
  final MealSuggestionRepository _mealSuggestionRepository;

  UpdateMealSuggestionUseCase(
      {required MealSuggestionRepository mealSuggestionRepository})
      : _mealSuggestionRepository = mealSuggestionRepository;

  Future<Result<void, Exception>> execute(
          {required int mealSuggestionId,
          required UpdateMealSuggestionRequestDTO
              updateMealSuggestionRequestDTO}) =>
      _mealSuggestionRepository.updateMealSuggestion(
          mealSuggestionId: mealSuggestionId,
          updateMealSuggestionRequestDTO: updateMealSuggestionRequestDTO);
}
