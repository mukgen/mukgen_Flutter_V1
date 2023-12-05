import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/domain/entity/meal/mukgen_pick_entity.dart';
import 'package:mukgen_flutter_v1/domain/repository/meal_repository/meal_repository.dart';

class ReadMukgenPickUseCase {
  final MealRepository _mealRepository;

  ReadMukgenPickUseCase({required MealRepository mealRepository})
      : _mealRepository = mealRepository;

  Future<Result<MukgenPickEntity, Exception>> execute() =>
      _mealRepository.readMukgenPick();
}
