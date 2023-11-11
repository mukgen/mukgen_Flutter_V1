import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/core/network/http_method.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_endpoint.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_rest_api_domain.dart';
import 'package:mukgen_flutter_v1/data/dto/meal/request/read_single_meal_request_dto.dart';

sealed class MealEndpoint extends MukgenEndpoint {
  MealEndpoint();

  factory MealEndpoint.readSingleMeal(
          {required ReadSingleMealRequestDTO readSingleMealRequestDTO}) =
      ReadSingleMeal;

  factory MealEndpoint.readTodayMeal() = ReadTodayMeal;

  factory MealEndpoint.readMukgenPick() = ReadMukgenPick;

  @override
  BaseRequestDTO? get body => switch (this) {
        ReadSingleMeal(readSingleMealRequestDTO: final readSingleMealBody) =>
          readSingleMealBody,
        ReadTodayMeal() => null,
        ReadMukgenPick() => null,
      };

  @override
  MukgenRestAPIDomain get domain => MukgenRestAPIDomain.meal;

  @override
  Map<int, Exception> get errorMap => throw UnimplementedError();

  @override
  HTTPMethod get httpMethod => switch (this) {
        ReadSingleMeal() => HTTPMethod.get,
        ReadTodayMeal() => HTTPMethod.get,
        ReadMukgenPick() => HTTPMethod.get,
      };

  @override
  JwtTokenType get jwtTokenType => switch (this) {
        ReadSingleMeal() => JwtTokenType.accessToken,
        ReadTodayMeal() => JwtTokenType.accessToken,
        ReadMukgenPick() => JwtTokenType.accessToken,
      };

  @override
  String get path => switch (this) {
        ReadSingleMeal() => "/meal",
        ReadTodayMeal() => "/meal/today",
        ReadMukgenPick() => "/mukgen-pick",
      };

  @override
  Map<String, dynamic>? get queryParam => switch (this) {
        ReadSingleMeal() => null,
        ReadTodayMeal() => null,
        ReadMukgenPick() => null,
      };
}

class ReadSingleMeal extends MealEndpoint {
  final ReadSingleMealRequestDTO readSingleMealRequestDTO;

  ReadSingleMeal({required this.readSingleMealRequestDTO});
}

class ReadTodayMeal extends MealEndpoint {}

class ReadMukgenPick extends MealEndpoint {}
