import 'package:equatable/equatable.dart';
import 'package:mukgen_flutter_v1/domain/entity/meal_suggestion/meal_suggestion_entity.dart';

enum MealSuggestionPageStateEnum { initial, loading, success, failure }

class MealSuggestionPageState extends Equatable {
  List<MealSuggestionEntity> mealSuggestions = [];
  final String failMessage;
  final MealSuggestionPageStateEnum state;

  MealSuggestionPageState(
      {required this.mealSuggestions,
      required this.state,
      required this.failMessage});

  MealSuggestionPageState.initial({
    this.state = MealSuggestionPageStateEnum.initial,
    this.failMessage = "",
  });

  @override
  List<Object> get props => [mealSuggestions];

  MealSuggestionPageState copyWith(
          {List<MealSuggestionEntity>? mealSuggestions,
          MealSuggestionPageStateEnum? state,
          String? failMessage}) =>
      MealSuggestionPageState(
          mealSuggestions: mealSuggestions ?? this.mealSuggestions,
          state: state ?? this.state,
          failMessage: failMessage ?? this.failMessage);
}
