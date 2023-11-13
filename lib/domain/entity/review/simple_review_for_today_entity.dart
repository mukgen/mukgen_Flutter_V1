import 'package:mukgen_flutter_v1/data/dto/meal/request/read_single_meal_request_dto.dart';

class SimpleReviewForTodayEntity {
  final int riceId, count, reviewId;
  final String review, userNickname, createdAt;
  final RiceType riceType;

  SimpleReviewForTodayEntity({
    required this.riceId,
    required this.count,
    required this.reviewId,
    required this.review,
    required this.userNickname,
    required this.createdAt,
    required this.riceType,
  });
}
