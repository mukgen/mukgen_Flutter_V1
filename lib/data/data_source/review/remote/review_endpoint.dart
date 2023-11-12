import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/core/network/http_method.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_endpoint.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_rest_api_domain.dart';

sealed class ReviewEndpoint extends MukgenEndpoint {
  ReviewEndpoint();

  factory ReviewEndpoint.readDetailReview({required int reviewId}) =
      ReadDetailReview;

  factory ReviewEndpoint.readAllReview() = ReadAllReview;

  factory ReviewEndpoint.readReviewRanking() = ReadReviewRanking;

  @override
  BaseRequestDTO? get body => switch (this) {
        ReadDetailReview() => null,
        ReadAllReview() => null,
        ReadReviewRanking() => null,
      };

  @override
  MukgenRestAPIDomain get domain => MukgenRestAPIDomain.review;

  @override
  Map<int, Exception> get errorMap => throw UnimplementedError();

  @override
  HTTPMethod get httpMethod => switch (this) {
        ReadDetailReview() => HTTPMethod.get,
        ReadAllReview() => HTTPMethod.get,
        ReadReviewRanking() => HTTPMethod.get,
      };

  @override
  JwtTokenType get jwtTokenType => switch (this) {
        ReadDetailReview() => JwtTokenType.accessToken,
        ReadAllReview() => JwtTokenType.accessToken,
        ReadReviewRanking() => JwtTokenType.accessToken,
      };

  @override
  String get path => switch (this) {
        ReadDetailReview(reviewId: final reviewId) => "/review/$reviewId",
        ReadAllReview() => "/review/total",
        ReadReviewRanking() => "/review/rank",
      };

  @override
  Map<String, dynamic>? get queryParam => switch (this) {
        ReadDetailReview() => null,
        ReadAllReview() => null,
        ReadReviewRanking() => null,
      };
}

final class ReadDetailReview extends ReviewEndpoint {
  final int reviewId;

  ReadDetailReview({required this.reviewId});
}

final class ReadAllReview extends ReviewEndpoint {}

final class ReadReviewRanking extends ReviewEndpoint {}
