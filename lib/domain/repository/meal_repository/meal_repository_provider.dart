import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/data/data_source/meal/remote/remote_meal_data_source_provider.dart';
import 'package:mukgen_flutter_v1/data/repository/meal_repository_impl.dart';
import 'package:mukgen_flutter_v1/domain/repository/meal_repository/meal_repository.dart';

final mealRepositoryProvider = Provider<MealRepository>((ref) {
  final remoteMealDataSource = ref.watch(remoteMealDataSourceProvider);
  return MealRepositoryImpl(remoteMealDataSource: remoteMealDataSource);
});