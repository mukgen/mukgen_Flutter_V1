import 'package:mukgen_flutter_v1/core/network/networking.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/data_source/meal_suggestion/remote/meal_suggestion_endpoint.dart';
import 'package:mukgen_flutter_v1/data/dto/meal_suggestion/request/create_meal_suggestion_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/meal_suggestion/request/update_meal_suggestion_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/meal_suggestion/response/read_all_meal_suggestion_response_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/meal_suggestion/meal_suggestion_entity.dart';

class RemoteMealSuggestionDataSource {
  final Networking _networking;

  RemoteMealSuggestionDataSource({required Networking networking})
      : _networking = networking;

  Future<Result<void, Exception>> createMealSuggestion(
          {required CreateMealSuggestionRequestDTO
              createMealSuggestionRequestDTO}) async =>
      await _networking.noResponseRequest(
          endpoint: MealSuggestionEndpoint.createMealSuggestion(
        createMealSuggestionRequestDTO: createMealSuggestionRequestDTO,
      ));

  Future<Result<void, Exception>> updateMealSuggestion(
          {required int mealSuggestionId,
          required UpdateMealSuggestionRequestDTO
              updateMealSuggestionRequestDTO}) async =>
      await _networking.noResponseRequest(
        endpoint: MealSuggestionEndpoint.updateMealSuggestion(
          mealSuggestionId: mealSuggestionId,
          updateMealSuggestionRequestDTO: updateMealSuggestionRequestDTO,
        ),
      );

  Future<Result<void, Exception>> deleteMealSuggestion(
          {required int mealSuggestionId}) async =>
      await _networking.noResponseRequest(
        endpoint: MealSuggestionEndpoint.deleteMealSuggestion(
          mealSuggestionId: mealSuggestionId,
        ),
      );

  Future<Result<List<MealSuggestionEntity>, Exception>>
      readAllMealSuggestion() async {
    final res = await _networking.request<ReadAllMealSuggestionResponseDTO,
            ReadAllMealSuggestionResponseDTO>(
        endpoint: MealSuggestionEndpoint.readAllMealSuggestion(),
        responseType: ReadAllMealSuggestionResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }

  Future<Result<void, Exception>> addMealSuggestionLike(
          {required int mealSuggestionId}) async =>
      await _networking.noResponseRequest(
        endpoint: MealSuggestionEndpoint.addMealSuggestionLike(
            mealSuggestionId: mealSuggestionId),
      );

  Future<Result<void, Exception>> addMealSuggestionDislike(
          {required int mealSuggestionId}) async =>
      await _networking.noResponseRequest(
        endpoint: MealSuggestionEndpoint.addMealSuggestionDislike(
            mealSuggestionId: mealSuggestionId),
      );
}
