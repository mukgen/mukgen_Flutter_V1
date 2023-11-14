import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/data_source/review/remote/remote_review_data_source.dart';
import 'package:mukgen_flutter_v1/domain/entity/review/detail_review_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/review/simple_review_for_day_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/review/simple_review_for_ranking_entity.dart';
import 'package:mukgen_flutter_v1/domain/repository/review_repository.dart';

class ReviewRepositoryImpl extends ReviewRepository {
  final RemoteReviewDataSource _remoteReviewDataSource;

  ReviewRepositoryImpl({required RemoteReviewDataSource remoteReviewDataSource})
      : _remoteReviewDataSource = remoteReviewDataSource;

  @override
  Future<Result<List<DetailReviewEntity>, Exception>> readAllReview() =>
      _remoteReviewDataSource.readAllReview();

  @override
  Future<Result<List<SimpleReviewForDayEntity>, Exception>>
      readAnotherDayReview({required String date}) =>
          _remoteReviewDataSource.readAnotherDayReview(date: date);

  @override
  Future<Result<DetailReviewEntity, Exception>> readDetailReview(
          {required int reviewId}) =>
      _remoteReviewDataSource.readDetailReview(reviewId: reviewId);

  @override
  Future<Result<List<DetailReviewEntity>, Exception>> readMyReview() =>
      _remoteReviewDataSource.readMyReview();

  @override
  Future<Result<List<SimpleReviewForRankingEntity>, Exception>>
      readReviewRanking() => _remoteReviewDataSource.readReviewRanking();

  @override
  Future<Result<List<SimpleReviewForDayEntity>, Exception>> readTodayReview() =>
      _remoteReviewDataSource.readTodayReview();
}
