import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/data_source/meal/remote/remote_meal_data_source.dart';
import 'package:mukgen_flutter_v1/data/dto/meal/request/read_single_meal_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/meal/meal_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/meal/mukgen_pick_entity.dart';
import 'package:mukgen_flutter_v1/domain/repository/meal_repository.dart';

class MealRepositoryImpl extends MealRepository {
  final RemoteMealDataSource _remoteMealDataSource;

  MealRepositoryImpl({required RemoteMealDataSource remoteMealDataSource})
      : _remoteMealDataSource = remoteMealDataSource;

  @override
  Future<Result<MukgenPickEntity, Exception>> readMukgenPick() =>
      _remoteMealDataSource.readMukgenPick();

  @override
  Future<Result<MealEntity, Exception>> readSingleMeal(
          {required ReadSingleMealRequestDTO readSingleMealRequestDTO}) =>
      _remoteMealDataSource.readSingleMeal(
          readSingleMealRequestDTO: readSingleMealRequestDTO);

  @override
  Future<Result<List<MealEntity>, Exception>> readTodayMeal() =>
      _remoteMealDataSource.readTodayMeal();
}
