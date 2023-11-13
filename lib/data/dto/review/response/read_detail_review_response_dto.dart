import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/review/detail_review_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/review/review_comment_entity.dart';

final class ReadDetailReviewResponseDTO
    extends BaseResponseDTO<DetailReviewEntity> {
  late final int count;
  late final String userNickname, content, createAt;
  late String? imageUrl;
  late List<ReviewCommentResponse> reviewCommentResponses;

  ReadDetailReviewResponseDTO();

  @override
  fromJson(Map<String, dynamic> json) {
    count = json['count'];
    userNickname = json['userNickname'];
    content = json['content'];
    createAt = json['createAt'];
    imageUrl = json['imageUrl'];
    if (json['reviewCommentResponseList'] != null) {
      reviewCommentResponses = List.empty(growable: true);
      json['reviewCommentResponseList'].forEach((data) {
        reviewCommentResponses.add(ReviewCommentResponse.fromJson(data));
      });
    }
  }

  @override
  DetailReviewEntity toEntity() => DetailReviewEntity(
        count: count,
        userNickname: userNickname,
        content: content,
        createAt: createAt,
        reviewCommentEntities:
            reviewCommentResponses.map((e) => e.toEntity()).toList(),
        imageUrl: imageUrl ?? "",
      );
}

final class ReviewCommentResponse extends BaseResponseDTO<ReviewCommentEntity> {
  late final int reviewCommentId;
  late final String content, createAt, updatedAt;

  ReviewCommentResponse();

  factory ReviewCommentResponse.fromJson(Map<String, dynamic> json) =>
      ReviewCommentResponse()
        ..reviewCommentId = json['reviewCommentId']
        ..content = json['content']
        ..createAt = json['createAt']
        ..updatedAt = json['updatedAt'];

  @override
  fromJson(Map<String, dynamic> json) => ReviewCommentResponse.fromJson(json);

  @override
  ReviewCommentEntity toEntity() => ReviewCommentEntity(
        reviewCommentId: reviewCommentId,
        content: content,
        createAt: createAt,
        updatedAt: updatedAt,
      );
}
