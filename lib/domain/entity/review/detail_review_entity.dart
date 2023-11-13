import 'package:mukgen_flutter_v1/domain/entity/review/review_comment_entity.dart';

class DetailReviewEntity {
  final int count;
  final String userNickname, content, createAt;
  final String imageUrl;
  List<ReviewCommentEntity> reviewCommentEntities;

  DetailReviewEntity(
      {required this.count,
      required this.userNickname,
      required this.content,
      required this.createAt,
      required this.reviewCommentEntities,
      this.imageUrl = ""});
}
