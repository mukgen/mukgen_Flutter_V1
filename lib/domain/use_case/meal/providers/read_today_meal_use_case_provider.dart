import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/domain/repository/meal_repository/meal_repository_provider.dart';
import 'package:mukgen_flutter_v1/domain/use_case/meal/read_today_meal_use_case.dart';

final readTodayMealUseCaseProvider = Provider<ReadTodayMealUseCase>((ref) => ReadTodayMealUseCase(mealRepository: ref.watch(mealRepositoryProvider)));