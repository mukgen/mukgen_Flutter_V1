import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/domain/use_case/meal_suggestion/providers/add_meal_suggestion_dislike_use_case_provider.dart';
import 'package:mukgen_flutter_v1/domain/use_case/meal_suggestion/providers/add_meal_suggestion_like_use_case_provider.dart';
import 'package:mukgen_flutter_v1/domain/use_case/meal_suggestion/providers/create_meal_suggestion_use_case_provider.dart';
import 'package:mukgen_flutter_v1/domain/use_case/meal_suggestion/providers/delete_meal_suggestion_use_case_provider.dart';
import 'package:mukgen_flutter_v1/domain/use_case/meal_suggestion/providers/read_all_meal_suggestion_use_case_provider.dart';
import 'package:mukgen_flutter_v1/domain/use_case/meal_suggestion/providers/update_meal_suggestion_use_case_provider.dart';
import 'package:mukgen_flutter_v1/screen/suggestion_main/provider/meal_suggestion_page_state.dart';
import 'package:mukgen_flutter_v1/screen/suggestion_main/provider/meal_suggestion_page_view_model.dart';

final mealSuggestionPageViewModelProvider =
    StateNotifierProvider<MealSuggestionPageViewModel, MealSuggestionPageState>(
  (ref) => MealSuggestionPageViewModel(
    addMealSuggestionDislikeUseCase:
        ref.watch(addMealSuggestionDislikeUseCaseProvider),
    addMealSuggestionLikeUseCase:
        ref.watch(addMealSuggestionLikeUseCaseProvider),
    createMealSuggestionUseCase: ref.watch(createMealSuggestionUseCaseProvider),
    deleteMealSuggestionUseCase: ref.watch(deleteMealSuggestionUseCaseProvider),
    readAllMealSuggestionUseCase:
        ref.watch(readAllMealSuggestionUseCaseProvider),
    updateMealSuggestionUseCase: ref.watch(updateMealSuggestionUseCaseProvider),
  ),
);
