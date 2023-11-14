import 'package:mukgen_flutter_v1/core/network/networking.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/data_source/meal/remote/meal_enpoint.dart';
import 'package:mukgen_flutter_v1/data/dto/meal/request/read_single_meal_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/meal/response/read_mukgen_pick_response_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/meal/response/read_single_meal_response_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/meal/response/read_today_meal_response_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/meal/meal_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/meal/mukgen_pick_entity.dart';

class RemoteMealDataSource {
  final Networking _networking;

  RemoteMealDataSource({required Networking networking})
      : _networking = networking;

  Future<Result<MealEntity, Exception>> readSingleMeal(
      {required ReadSingleMealRequestDTO readSingleMealRequestDTO}) async {
    final res = await _networking
        .request<ReadSingleMealResponseDTO, ReadSingleMealResponseDTO>(
            endpoint: MealEndpoint.readSingleMeal(
                readSingleMealRequestDTO: readSingleMealRequestDTO),
            responseType: ReadSingleMealResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }

  Future<Result<List<MealEntity>, Exception>> readTodayMeal() async {
    final res = await _networking
        .request<ReadTodayMealResponseDTO, List<ReadTodayMealResponseDTO>>(
            endpoint: MealEndpoint.readTodayMeal(),
            responseType: ReadTodayMealResponseDTO());
    return switch (res) {
      Success(value: final value) =>
        Success(value: value.map((e) => e.toEntity()).toList()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }

  Future<Result<MukgenPickEntity, Exception>> readMukgenPick() async {
    final res = await _networking
        .request<ReadMukgenPickResponseDTO, ReadMukgenPickResponseDTO>(
            endpoint: MealEndpoint.readMukgenPick(),
            responseType: ReadMukgenPickResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }
}
