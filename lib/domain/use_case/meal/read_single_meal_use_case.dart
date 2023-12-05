import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/meal/request/read_single_meal_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/meal/meal_entity.dart';
import 'package:mukgen_flutter_v1/domain/repository/meal_repository/meal_repository.dart';

class ReadSingleMealUseCase {
  final MealRepository _mealRepository;

  ReadSingleMealUseCase({required MealRepository mealRepository})
      : _mealRepository = mealRepository;

  Future<Result<MealEntity, Exception>> execute(
      {required ReadSingleMealRequestDTO readSingleMealRequestDTO}) async {
    final res =
        await _mealRepository.readSingleMeal(readSingleMealRequestDTO: readSingleMealRequestDTO);
    switch (res) {
      case Success(value: final value) :
        return Success(value: value);
      case Failure(exception: final e) :
        return Failure(exception: e);
    }
  }
}
