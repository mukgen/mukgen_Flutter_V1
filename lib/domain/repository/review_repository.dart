import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/domain/entity/review/detail_review_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/review/simple_review_for_day_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/review/simple_review_for_ranking_entity.dart';

abstract class ReviewRepository {
  Future<Result<DetailReviewEntity, Exception>> readDetailReview(
      {required int reviewId});

  Future<Result<List<DetailReviewEntity>, Exception>> readMyReview();

  Future<Result<List<SimpleReviewForRankingEntity>, Exception>>
      readReviewRanking();

  Future<Result<List<SimpleReviewForDayEntity>, Exception>> readTodayReview();

  Future<Result<List<SimpleReviewForDayEntity>, Exception>>
      readAnotherDayReview({required String date});

  Future<Result<List<DetailReviewEntity>, Exception>> readAllReview();
}
