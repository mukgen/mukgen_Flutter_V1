import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/meal_suggestion/request/create_meal_suggestion_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/repository/meal_suggestion/meal_suggestion_repository.dart';

class CreateMealSuggestionUseCase {
  final MealSuggestionRepository _mealSuggestionRepository;

  CreateMealSuggestionUseCase(
      {required MealSuggestionRepository mealSuggestionRepository})
      : _mealSuggestionRepository = mealSuggestionRepository;

  Future<Result<void, Exception>> execute(
          {required CreateMealSuggestionRequestDTO
              createMealSuggestionRequestDTO}) =>
      _mealSuggestionRepository.createMealSuggestion(
          createMealSuggestionRequestDTO: createMealSuggestionRequestDTO);
}
