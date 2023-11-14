import 'package:mukgen_flutter_v1/domain/entity/board/board_comment_entity.dart';

class DetailBoardEntity {
  final int likeCount, commentCount, viewCount;
  final String title, content, userNickname, createdAt, updatedAt;
  final List<String> userNicknames;
  final List<BoardCommentEntity> boardCommentEntities;

  DetailBoardEntity({
    required this.likeCount,
    required this.commentCount,
    required this.viewCount,
    required this.title,
    required this.content,
    required this.userNickname,
    required this.createdAt,
    required this.updatedAt,
    required this.userNicknames,
    required this.boardCommentEntities,
  });
}
