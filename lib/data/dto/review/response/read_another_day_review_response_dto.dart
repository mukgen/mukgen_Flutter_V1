import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/review/response/read_today_review_response_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/review/simple_review_for_day_entity.dart';

final class ReadAnotherDayReviewResponseDTO
    extends BaseResponseDTO<List<SimpleReviewForDayEntity>> {
  late final List<DayReviewResponse> anotherDayReviewResponses;

  @override
  fromJson(Map<String, dynamic> json) {
    if (json['reviewResponseList'] != null) {
      anotherDayReviewResponses = List.empty(growable: true);
      json['reviewResponseList'].forEach((data) {
        anotherDayReviewResponses.add(DayReviewResponse.fromJson(data));
      });
    }
  }

  @override
  List<SimpleReviewForDayEntity> toEntity() =>
      anotherDayReviewResponses.map((e) => e.toEntity()).toList();
}
