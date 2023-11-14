import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/core/network/http_method.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_endpoint.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_rest_api_domain.dart';

sealed class ReviewEndpoint extends MukgenEndpoint {
  ReviewEndpoint();

  factory ReviewEndpoint.readDetailReview({required int reviewId}) =
      ReadDetailReview;

  factory ReviewEndpoint.readMyReview() = ReadMyReview;

  factory ReviewEndpoint.readReviewRanking() = ReadReviewRanking;

  factory ReviewEndpoint.readAnotherDayReview({required String date}) =
      ReadAnotherDayReview;

  factory ReviewEndpoint.readAllReview() = ReadAllReview;

  factory ReviewEndpoint.readTodayReview() = ReadTodayReview;

  @override
  BaseRequestDTO? get body => switch (this) {
        ReadDetailReview() => null,
        ReadMyReview() => null,
        ReadReviewRanking() => null,
        ReadAnotherDayReview() => null,
        ReadAllReview() => null,
        ReadTodayReview() => null
      };

  @override
  MukgenRestAPIDomain get domain => MukgenRestAPIDomain.review;

  @override
  Map<int, Exception> get errorMap => throw UnimplementedError();

  @override
  HTTPMethod get httpMethod => switch (this) {
        ReadDetailReview() => HTTPMethod.get,
        ReadMyReview() => HTTPMethod.get,
        ReadReviewRanking() => HTTPMethod.get,
        ReadAnotherDayReview() => HTTPMethod.get,
        ReadAllReview() => HTTPMethod.get,
        ReadTodayReview() => HTTPMethod.get,
      };

  @override
  JwtTokenType get jwtTokenType => switch (this) {
        ReadDetailReview() => JwtTokenType.accessToken,
        ReadMyReview() => JwtTokenType.accessToken,
        ReadReviewRanking() => JwtTokenType.accessToken,
        ReadAnotherDayReview() => JwtTokenType.accessToken,
        ReadAllReview() => JwtTokenType.accessToken,
        ReadTodayReview() => JwtTokenType.accessToken,
      };

  @override
  String get path => switch (this) {
        ReadDetailReview(reviewId: final reviewId) => "/review/$reviewId",
        ReadMyReview() => "/review/total",
        ReadReviewRanking() => "/review/rank",
        ReadAnotherDayReview(date: final date) => "/review/date/$date",
        ReadAllReview() => "/review/all",
        ReadTodayReview() => "/review/today",
      };

  @override
  Map<String, dynamic>? get queryParam => switch (this) {
        ReadDetailReview() => null,
        ReadMyReview() => null,
        ReadReviewRanking() => null,
        ReadAnotherDayReview() => null,
        ReadAllReview() => null,
        ReadTodayReview() => null,
      };
}

final class ReadDetailReview extends ReviewEndpoint {
  final int reviewId;

  ReadDetailReview({required this.reviewId});
}

final class ReadMyReview extends ReviewEndpoint {}

final class ReadReviewRanking extends ReviewEndpoint {}

final class ReadAnotherDayReview extends ReviewEndpoint {
  final String date;

  //date는 yyyyddmm(년도, 월, 일. 예시)20230808) 형태로 작성할 것.

  ReadAnotherDayReview({required this.date});
}

final class ReadAllReview extends ReviewEndpoint {}

final class ReadTodayReview extends ReviewEndpoint {}
