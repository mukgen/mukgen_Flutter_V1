import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/domain/repository/meal_repository/meal_repository_provider.dart';
import 'package:mukgen_flutter_v1/domain/use_case/meal/read_single_meal_use_case.dart';

final readSingleMealUseCaseProvider = Provider<ReadSingleMealUseCase>((ref) =>
    ReadSingleMealUseCase(mealRepository: ref.watch(mealRepositoryProvider)));
