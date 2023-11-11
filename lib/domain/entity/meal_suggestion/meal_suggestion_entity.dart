class MealSuggestionEntity {
  final int id, likeCount, dislikeCount;
  final String content;
  final bool checked;

  MealSuggestionEntity({
    required this.id,
    required this.likeCount,
    required this.dislikeCount,
    required this.content,
    required this.checked,
  });
}
