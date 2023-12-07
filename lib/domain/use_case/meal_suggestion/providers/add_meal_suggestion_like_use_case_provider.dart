import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/domain/repository/meal_suggestion/meal_suggestion_repository_provider.dart';
import 'package:mukgen_flutter_v1/domain/use_case/meal_suggestion/add_meal_suggestion_like_use_case.dart';

final addMealSuggestionLikeUseCaseProvider =
    Provider<AddMealSuggestionLikeUseCase>((ref) =>
        AddMealSuggestionLikeUseCase(
            mealSuggestionRepository:
                ref.watch(mealSuggestionRepositoryProvider)));
