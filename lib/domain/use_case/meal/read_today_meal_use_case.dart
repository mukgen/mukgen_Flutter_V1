import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/domain/entity/meal/meal_entity.dart';
import 'package:mukgen_flutter_v1/domain/repository/meal_repository/meal_repository.dart';

class ReadTodayMealUseCase {
  final MealRepository _mealRepository;

  ReadTodayMealUseCase({required MealRepository mealRepository})
      : _mealRepository = mealRepository;

  Future<Result<List<MealEntity>, Exception>> execute() =>
      _mealRepository.readTodayMeal();
}
