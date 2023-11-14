import 'package:mukgen_flutter_v1/data/dto/meal/request/read_single_meal_request_dto.dart';

class SimpleReviewForDayEntity {
  final int riceId, count, reviewId;
  final String review, userNickname, createdAt;
  final RiceType riceType;

  SimpleReviewForDayEntity({
    required this.riceId,
    required this.count,
    required this.reviewId,
    required this.review,
    required this.userNickname,
    required this.createdAt,
    required this.riceType,
  });
}
