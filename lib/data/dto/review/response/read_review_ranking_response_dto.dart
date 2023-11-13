import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/review/simple_review_for_ranking_entity.dart';

final class ReadReviewRankingResponseDTO
    extends BaseResponseDTO<List<SimpleReviewForRankingEntity>> {
  late List<ReviewRankingResponse> reviewRankingResponses;

  ReadReviewRankingResponseDTO();

  @override
  fromJson(Map<String, dynamic> json) {
    if (json['reviewRankResponseList'] != null) {
      reviewRankingResponses = List.empty(growable: true);
      json['reviewRankResponseList'].forEach((data) {
        reviewRankingResponses.add(ReviewRankingResponse.fromJson(data));
      });
    }
  }

  @override
  List<SimpleReviewForRankingEntity> toEntity() =>
      reviewRankingResponses.map((e) => e.toEntity()).toList();
}

final class ReviewRankingResponse
    extends BaseResponseDTO<SimpleReviewForRankingEntity> {
  late final int reviewCount, averageReview;
  late final String profileUrl, userNickname;

  ReviewRankingResponse();

  factory ReviewRankingResponse.fromJson(Map<String, dynamic> json) =>
      ReviewRankingResponse()
        ..reviewCount = json['reviewCount']
        ..averageReview = json['averageReview']
        ..profileUrl = json['profileUrl']
        ..userNickname = json['userNickname'];

  @override
  fromJson(Map<String, dynamic> json) => ReviewRankingResponse.fromJson(json);

  @override
  SimpleReviewForRankingEntity toEntity() => SimpleReviewForRankingEntity(
      reviewCount: reviewCount,
      averageReview: averageReview,
      profileUrl: profileUrl,
      userNickname: userNickname);
}
