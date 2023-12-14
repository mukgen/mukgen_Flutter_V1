import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart' as r;
import 'package:mukgen_flutter_v1/domain/entity/meal_suggestion/meal_suggestion_entity.dart';
import 'package:mukgen_flutter_v1/domain/use_case/meal_suggestion/add_meal_suggestion_dislike_use_case.dart';
import 'package:mukgen_flutter_v1/domain/use_case/meal_suggestion/add_meal_suggestion_like_use_case.dart';
import 'package:mukgen_flutter_v1/domain/use_case/meal_suggestion/create_meal_suggestion_use_case.dart';
import 'package:mukgen_flutter_v1/domain/use_case/meal_suggestion/delete_meal_suggestion_use_case.dart';
import 'package:mukgen_flutter_v1/domain/use_case/meal_suggestion/read_all_meal_suggestion_use_case.dart';
import 'package:mukgen_flutter_v1/domain/use_case/meal_suggestion/update_meal_suggestion_use_case.dart';
import 'package:mukgen_flutter_v1/screen/suggestion_main/provider/meal_suggestion_page_state.dart';

class MealSuggestionPageViewModel
    extends StateNotifier<MealSuggestionPageState> {
  final AddMealSuggestionDislikeUseCase _addMealSuggestionDislikeUseCase;
  final AddMealSuggestionLikeUseCase _addMealSuggestionLikeUseCase;
  final CreateMealSuggestionUseCase _createMealSuggestionUseCase;
  final DeleteMealSuggestionUseCase _deleteMealSuggestionUseCase;
  final ReadAllMealSuggestionUseCase _readAllMealSuggestionUseCase;
  final UpdateMealSuggestionUseCase _updateMealSuggestionUseCase;

  MealSuggestionPageViewModel(
      {required AddMealSuggestionDislikeUseCase addMealSuggestionDislikeUseCase,
      required AddMealSuggestionLikeUseCase addMealSuggestionLikeUseCase,
      required CreateMealSuggestionUseCase createMealSuggestionUseCase,
      required DeleteMealSuggestionUseCase deleteMealSuggestionUseCase,
      required ReadAllMealSuggestionUseCase readAllMealSuggestionUseCase,
      required UpdateMealSuggestionUseCase updateMealSuggestionUseCase})
      : _addMealSuggestionDislikeUseCase = addMealSuggestionDislikeUseCase,
        _addMealSuggestionLikeUseCase = addMealSuggestionLikeUseCase,
        _createMealSuggestionUseCase = createMealSuggestionUseCase,
        _deleteMealSuggestionUseCase = deleteMealSuggestionUseCase,
        _readAllMealSuggestionUseCase = readAllMealSuggestionUseCase,
        _updateMealSuggestionUseCase = updateMealSuggestionUseCase,
        super(MealSuggestionPageState.initial());

  Future<void> readAllMealSuggestion() async {
    state = state.copyWith(state: MealSuggestionPageStateEnum.loading);
    final res = await _readAllMealSuggestionUseCase.execute();
    switch (res) {
      case r.Success(value: final value):
        state = state.copyWith(
            state: MealSuggestionPageStateEnum.success, mealSuggestions: value);
      case r.Failure(exception: final e):
        state = state.copyWith(
            state: MealSuggestionPageStateEnum.failure, mealSuggestions: []);
    }
  }

  Future<void> addMealSuggestionDislike({required int mealSuggestionId}) async {
    final res = await _addMealSuggestionDislikeUseCase.execute(
        mealSuggestionId: mealSuggestionId);
    switch (res) {
      case r.Success():
        state = state.copyWith(
            state: MealSuggestionPageStateEnum.success,
            mealSuggestions: state.mealSuggestions
                .map((e) => e.id == mealSuggestionId
                    ? MealSuggestionEntity(
                        id: e.id,
                        likeCount: e.likeCount,
                        dislikeCount: e.dislikeCount + 1,
                        content: e.content,
                        checked: e.checked)
                    : e)
                .toList());
      case r.Failure(exception: final e):
        state = state.copyWith(
            state: MealSuggestionPageStateEnum.failure,
            failMessage: e.toString());
    }
  }
}
