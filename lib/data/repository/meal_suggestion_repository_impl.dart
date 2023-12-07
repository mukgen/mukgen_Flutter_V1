import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/data_source/meal_suggestion/remote/remote_meal_suggestion_data_source.dart';
import 'package:mukgen_flutter_v1/data/dto/meal_suggestion/request/create_meal_suggestion_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/meal_suggestion/request/update_meal_suggestion_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/meal_suggestion/meal_suggestion_entity.dart';
import 'package:mukgen_flutter_v1/domain/repository/meal_suggestion/meal_suggestion_repository.dart';

class MealSuggestionRepositoryImpl extends MealSuggestionRepository {
  final RemoteMealSuggestionDataSource _remoteMealSuggestionDataSource;

  MealSuggestionRepositoryImpl(
      {required RemoteMealSuggestionDataSource remoteMealSuggestionDataSource})
      : _remoteMealSuggestionDataSource = remoteMealSuggestionDataSource;

  @override
  Future<Result<void, Exception>> addMealSuggestionDislike(
          {required int mealSuggestionId}) =>
      _remoteMealSuggestionDataSource.addMealSuggestionDislike(
          mealSuggestionId: mealSuggestionId);

  @override
  Future<Result<void, Exception>> addMealSuggestionLike(
          {required int mealSuggestionId}) =>
      _remoteMealSuggestionDataSource.addMealSuggestionLike(
          mealSuggestionId: mealSuggestionId);

  @override
  Future<Result<void, Exception>> createMealSuggestion(
          {required CreateMealSuggestionRequestDTO
              createMealSuggestionRequestDTO}) =>
      _remoteMealSuggestionDataSource.createMealSuggestion(
          createMealSuggestionRequestDTO: createMealSuggestionRequestDTO);

  @override
  Future<Result<void, Exception>> deleteMealSuggestion(
          {required int mealSuggestionId}) =>
      _remoteMealSuggestionDataSource.deleteMealSuggestion(
          mealSuggestionId: mealSuggestionId);

  @override
  Future<Result<List<MealSuggestionEntity>, Exception>>
      readAllMealSuggestion() =>
          _remoteMealSuggestionDataSource.readAllMealSuggestion();

  @override
  Future<Result<void, Exception>> updateMealSuggestion(
          {required int mealSuggestionId,
          required UpdateMealSuggestionRequestDTO
              updateMealSuggestionRequestDTO}) =>
      _remoteMealSuggestionDataSource.updateMealSuggestion(
          mealSuggestionId: mealSuggestionId,
          updateMealSuggestionRequestDTO: updateMealSuggestionRequestDTO);
}
