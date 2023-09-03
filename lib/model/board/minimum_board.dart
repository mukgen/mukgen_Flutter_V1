class BoardMinimum {
  final String? title;
  final String? content;
  final String? userNickname;
  final int? likeCount;
  final int? commentCount;
  final int? viewCount;
  final String? createdAt;
  final String? updatedAt;
  final bool? updated;

  BoardMinimum({
    this.title = '',
    this.content = '',
    this.userNickname = '',
    this.likeCount = 0,
    this.commentCount = 0,
    this.viewCount = 0,
    this.createdAt = '',
    this.updated = false,
    this.updatedAt = ''
  });
}