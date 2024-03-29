import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/core/network/http_method.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_endpoint.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_rest_api_domain.dart';
import 'package:mukgen_flutter_v1/data/dto/meal_suggestion/request/create_meal_suggestion_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/meal_suggestion/request/update_meal_suggestion_request_dto.dart';

sealed class MealSuggestionEndpoint extends MukgenEndpoint {
  MealSuggestionEndpoint();

  factory MealSuggestionEndpoint.createMealSuggestion(
      {required CreateMealSuggestionRequestDTO
          createMealSuggestionRequestDTO}) = CreateMealSuggestion;

  factory MealSuggestionEndpoint.updateMealSuggestion(
      {required int mealSuggestionId,
      required UpdateMealSuggestionRequestDTO
          updateMealSuggestionRequestDTO}) = UpdateMealSuggestion;

  factory MealSuggestionEndpoint.deleteMealSuggestion(
      {required int mealSuggestionId}) = DeleteMealSuggestion;

  factory MealSuggestionEndpoint.readAllMealSuggestion() =
      ReadAllMealSuggestion;

  factory MealSuggestionEndpoint.addMealSuggestionLike(
      {required int mealSuggestionId}) = AddMealSuggestionLike;

  factory MealSuggestionEndpoint.addMealSuggestionDislike(
      {required int mealSuggestionId}) = AddMealSuggestionDislike;

  @override
  BaseRequestDTO? get body => switch (this) {
        CreateMealSuggestion(
          createMealSuggestionRequestDTO: final createMealSuggestionBody
        ) =>
          createMealSuggestionBody,
        UpdateMealSuggestion(
          updateMealSuggestionRequestDTO: final updateMealSuggestionBody
        ) =>
          updateMealSuggestionBody,
        DeleteMealSuggestion() => null,
        ReadAllMealSuggestion() => null,
        AddMealSuggestionLike() => null,
        AddMealSuggestionDislike() => null,
      };

  @override
  MukgenRestAPIDomain get domain => MukgenRestAPIDomain.mealSuggestion;

  @override
  Map<int, Exception> get errorMap => throw UnimplementedError();

  @override
  HTTPMethod get httpMethod => switch (this) {
        CreateMealSuggestion() => HTTPMethod.post,
        UpdateMealSuggestion() => HTTPMethod.put,
        DeleteMealSuggestion() => HTTPMethod.delete,
        ReadAllMealSuggestion() => HTTPMethod.get,
        AddMealSuggestionLike() => HTTPMethod.post,
        AddMealSuggestionDislike() => HTTPMethod.post,
      };

  @override
  JwtTokenType get jwtTokenType => switch (this) {
        CreateMealSuggestion() => JwtTokenType.accessToken,
        UpdateMealSuggestion() => JwtTokenType.accessToken,
        DeleteMealSuggestion() => JwtTokenType.accessToken,
        ReadAllMealSuggestion() => JwtTokenType.accessToken,
        AddMealSuggestionLike() => JwtTokenType.accessToken,
        AddMealSuggestionDislike() => JwtTokenType.accessToken,
      };

  @override
  String get path => switch (this) {
        CreateMealSuggestion() => "/meal-suggestion",
        UpdateMealSuggestion(mealSuggestionId: final mealSuggestionId) =>
          "/meal-suggestion/$mealSuggestionId",
        DeleteMealSuggestion(mealSuggestionId: final mealSuggestionId) =>
          "/meal-suggestion/$mealSuggestionId",
        ReadAllMealSuggestion() => "/meal-suggestion/list",
        AddMealSuggestionLike(mealSuggestionId: final mealSuggestionId) =>
          "/meal-suggestion/like/$mealSuggestionId",
        AddMealSuggestionDislike(mealSuggestionId: final mealSuggestionId) =>
          "/meal-suggestion/dislike/$mealSuggestionId",
      };

  @override
  Map<String, dynamic>? get queryParam => switch (this) {
        CreateMealSuggestion() => null,
        UpdateMealSuggestion() => null,
        DeleteMealSuggestion() => null,
        ReadAllMealSuggestion() => null,
        AddMealSuggestionLike() => null,
        AddMealSuggestionDislike() => null,
      };
}

final class CreateMealSuggestion extends MealSuggestionEndpoint {
  final CreateMealSuggestionRequestDTO createMealSuggestionRequestDTO;

  CreateMealSuggestion({required this.createMealSuggestionRequestDTO});
}

final class UpdateMealSuggestion extends MealSuggestionEndpoint {
  final int mealSuggestionId;
  final UpdateMealSuggestionRequestDTO updateMealSuggestionRequestDTO;

  UpdateMealSuggestion({
    required this.mealSuggestionId,
    required this.updateMealSuggestionRequestDTO,
  });
}

final class DeleteMealSuggestion extends MealSuggestionEndpoint {
  final int mealSuggestionId;

  DeleteMealSuggestion({required this.mealSuggestionId});
}

final class ReadAllMealSuggestion extends MealSuggestionEndpoint {}

final class AddMealSuggestionLike extends MealSuggestionEndpoint {
  final int mealSuggestionId;

  AddMealSuggestionLike({required this.mealSuggestionId});
}

final class AddMealSuggestionDislike extends MealSuggestionEndpoint {
  final int mealSuggestionId;

  AddMealSuggestionDislike({required this.mealSuggestionId});
}
