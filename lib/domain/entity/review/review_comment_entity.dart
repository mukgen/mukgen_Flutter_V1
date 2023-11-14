class ReviewCommentEntity {
  final int reviewCommentId;
  final String content, createAt, updatedAt;

  ReviewCommentEntity({
    required this.reviewCommentId,
    required this.content,
    required this.createAt,
    required this.updatedAt,
  });
}
