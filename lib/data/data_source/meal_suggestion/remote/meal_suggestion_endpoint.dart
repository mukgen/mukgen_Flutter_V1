import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/core/network/http_method.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_endpoint.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_rest_api_domain.dart';
import 'package:mukgen_flutter_v1/data/dto/meal_suggestion/request/create_meal_suggestion_request_dto.dart';

sealed class MealSuggestionEndpoint extends MukgenEndpoint {
  MealSuggestionEndpoint();

  factory MealSuggestionEndpoint.createMealSuggestion(
      {required CreateMealSuggestionRequestDTO
          createMealSuggestionRequestDTO}) = CreateMealSuggestion;

  @override
  BaseRequestDTO? get body => switch (this) {
        CreateMealSuggestion(
          createMealSuggestionRequestDTO: final createMealSuggestionBody
        ) =>
          createMealSuggestionBody,
      };

  @override
  MukgenRestAPIDomain get domain => MukgenRestAPIDomain.mealSuggestion;

  @override
  Map<int, Exception> get errorMap => throw UnimplementedError();

  @override
  HTTPMethod get httpMethod => switch (this) {
        CreateMealSuggestion() => HTTPMethod.post,
      };

  @override
  JwtTokenType get jwtTokenType => switch (this) {
        CreateMealSuggestion() => JwtTokenType.accessToken,
      };

  @override
  String get path => switch (this) {
        CreateMealSuggestion() => "/meal-suggestion",
      };

  @override
  Map<String, dynamic>? get queryParam => switch (this) {
        CreateMealSuggestion() => null,
      };
}

final class CreateMealSuggestion extends MealSuggestionEndpoint {
  final CreateMealSuggestionRequestDTO createMealSuggestionRequestDTO;

  CreateMealSuggestion({required this.createMealSuggestionRequestDTO});
}
