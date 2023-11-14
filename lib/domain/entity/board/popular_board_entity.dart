class PopularBoardEntity {
  final int boardId, commentCount, viewCount;
  final String title;

  PopularBoardEntity({
    required this.boardId,
    required this.commentCount,
    required this.viewCount,
    required this.title,
  });
}
