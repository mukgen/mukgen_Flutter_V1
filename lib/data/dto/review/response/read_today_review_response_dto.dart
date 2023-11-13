import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/meal/request/read_single_meal_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/review/simple_review_for_day_entity.dart';

final class ReadTodayReviewResponseDTO
    extends BaseResponseDTO<List<SimpleReviewForDayEntity>> {
  late List<DayReviewResponse> todayReviewResponses;

  @override
  fromJson(Map<String, dynamic> json) {
    if (json['reviewResponseList'] != null) {
      todayReviewResponses = List.empty(growable: true);
      json['reviewResponseList'].forEach((data) {
        todayReviewResponses.add(DayReviewResponse.fromJson(data));
      });
    }
  }

  @override
  List<SimpleReviewForDayEntity> toEntity() =>
      todayReviewResponses.map((e) => e.toEntity()).toList();
}

final class DayReviewResponse
    extends BaseResponseDTO<SimpleReviewForDayEntity> {
  late final int riceId, count, reviewId;
  late final String review, userNickname, createdAt;
  late final RiceType riceType;

  DayReviewResponse();

  factory DayReviewResponse.fromJson(Map<String, dynamic> json) =>
      DayReviewResponse()
        ..riceId = json['riceId']
        ..count = json['count']
        ..reviewId = json['reviewId']
        ..review = json['review']
        ..userNickname = json['userNickname']
        ..createdAt = json['createdAt']
        ..riceType =
            RiceType.values.byName(json['riceType'].toString().toLowerCase());

  @override
  fromJson(Map<String, dynamic> json) => DayReviewResponse.fromJson(json);

  @override
  SimpleReviewForDayEntity toEntity() => SimpleReviewForDayEntity(
        riceId: riceId,
        count: count,
        reviewId: reviewId,
        review: review,
        userNickname: userNickname,
        createdAt: createdAt,
        riceType: riceType,
      );
}
