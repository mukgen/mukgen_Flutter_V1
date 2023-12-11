import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/meal_suggestion/meal_suggestion_entity.dart';

final class ReadAllMealSuggestionResponseDTO
    extends BaseResponseDTO<List<MealSuggestionEntity>> {
  late List<MealSuggestionResponse> mealSuggestions;

  ReadAllMealSuggestionResponseDTO();

  @override
  fromJson(Map<String, dynamic> json) {
    if (json['mealSuggestionResponseList'] != null) {
      mealSuggestions = List.empty(growable: true);
      json['mealSuggestionResponseList'].forEach((data) {
        mealSuggestions.add(MealSuggestionResponse.fromJson(data));
      });
    }
  }

  @override
  List<MealSuggestionEntity> toEntity() =>
      mealSuggestions.map((e) => e.toEntity()).toList();
}

final class MealSuggestionResponse
    extends BaseResponseDTO<MealSuggestionEntity> {
  late final int id, likeCount, dislikeCount;
  late final String content;
  late final bool checked;

  MealSuggestionResponse();

  factory MealSuggestionResponse.fromJson(Map<String, dynamic> json) =>
      MealSuggestionResponse()
        ..id = json['id']
        ..likeCount = json['likeCount']
        ..dislikeCount = json['dislikeCount']
        ..content = json['content']
        ..checked = json['checked'];

  @override
  fromJson(Map<String, dynamic> json) => MealSuggestionResponse.fromJson(json);

  @override
  MealSuggestionEntity toEntity() => MealSuggestionEntity(
      id: id,
      likeCount: likeCount,
      dislikeCount: dislikeCount,
      content: content,
      checked: checked);
}
