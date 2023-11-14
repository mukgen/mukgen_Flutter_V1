import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/meal/request/read_single_meal_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/meal/meal_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/meal/mukgen_pick_entity.dart';

abstract class MealRepository {
  Future<Result<MealEntity, Exception>> readSingleMeal(
      {required ReadSingleMealRequestDTO readSingleMealRequestDTO});

  Future<Result<List<MealEntity>, Exception>> readTodayMeal();

  Future<Result<MukgenPickEntity, Exception>> readMukgenPick();
}
