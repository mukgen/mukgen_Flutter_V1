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

  factory ReviewEndpoint.readAnotherDayReview({required String date}) =
      ReadAnotherDayReview;

  @override
  BaseRequestDTO? get body => switch (this) {
        ReadDetailReview() => null,
        ReadAllReview() => null,
        ReadReviewRanking() => null,
        ReadAnotherDayReview() => null,
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
        ReadAnotherDayReview() => HTTPMethod.get,
      };

  @override
  JwtTokenType get jwtTokenType => switch (this) {
        ReadDetailReview() => JwtTokenType.accessToken,
        ReadAllReview() => JwtTokenType.accessToken,
        ReadReviewRanking() => JwtTokenType.accessToken,
        ReadAnotherDayReview() => JwtTokenType.accessToken,
      };

  @override
  String get path => switch (this) {
        ReadDetailReview(reviewId: final reviewId) => "/review/$reviewId",
        ReadAllReview() => "/review/total",
        ReadReviewRanking() => "/review/rank",
        ReadAnotherDayReview(date: final date) => "/review/date/$date",
      };

  @override
  Map<String, dynamic>? get queryParam => switch (this) {
        ReadDetailReview() => null,
        ReadAllReview() => null,
        ReadReviewRanking() => null,
        ReadAnotherDayReview() => null,
      };
}

final class ReadDetailReview extends ReviewEndpoint {
  final int reviewId;

  ReadDetailReview({required this.reviewId});
}

final class ReadAllReview extends ReviewEndpoint {}

final class ReadReviewRanking extends ReviewEndpoint {}

final class ReadAnotherDayReview extends ReviewEndpoint {
  final String date;

  //date는 yyyyddmm(년도, 월, 일. 예시)20230808) 형태로 작성할 것.

  ReadAnotherDayReview({required this.date});
}
