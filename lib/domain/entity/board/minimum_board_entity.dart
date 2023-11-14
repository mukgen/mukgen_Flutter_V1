class MinimumBoardEntity {
  final int boardId, likeCount, commentCount;
  final String title, content, userNickname, createdAt, updatedAt;
  final bool updated, isLiked;

  MinimumBoardEntity({
    required this.boardId,
    required this.likeCount,
    required this.commentCount,
    required this.title,
    required this.content,
    required this.userNickname,
    required this.createdAt,
    required this.updatedAt,
    required this.updated,
    required this.isLiked,
  });
}
