class BoardCommentEntity {
  final int boardCommentId;
  final String writer, content, createdAt;

  BoardCommentEntity({
    required this.boardCommentId,
    required this.writer,
    required this.content,
    required this.createdAt,
  });
}
