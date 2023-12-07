import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/meal_suggestion/request/create_meal_suggestion_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/meal_suggestion/request/update_meal_suggestion_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/meal_suggestion/meal_suggestion_entity.dart';

abstract class MealSuggestionRepository {
  Future<Result<void, Exception>> createMealSuggestion(
      {required CreateMealSuggestionRequestDTO createMealSuggestionRequestDTO});

  Future<Result<void, Exception>> updateMealSuggestion(
      {required int mealSuggestionId,
      required UpdateMealSuggestionRequestDTO updateMealSuggestionRequestDTO});

  Future<Result<void, Exception>> deleteMealSuggestion(
      {required int mealSuggestionId});

  Future<Result<List<MealSuggestionEntity>, Exception>> readAllMealSuggestion();

  Future<Result<void, Exception>> addMealSuggestionLike(
      {required int mealSuggestionId});

  Future<Result<void, Exception>> addMealSuggestionDislike(
      {required int mealSuggestionId});
}
