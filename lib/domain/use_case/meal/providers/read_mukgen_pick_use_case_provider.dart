import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/domain/repository/meal_repository/meal_repository_provider.dart';
import 'package:mukgen_flutter_v1/domain/use_case/meal/read_mukgen_pick_use_case.dart';

final readMukgenPickUseCaseProvider = Provider<ReadMukgenPickUseCase>((ref) =>
    ReadMukgenPickUseCase(mealRepository: ref.watch(mealRepositoryProvider)));
