import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/review/response/read_detail_review_response_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/review/detail_review_entity.dart';

final class ReadMyReviewResponseDTO
    extends BaseResponseDTO<List<DetailReviewEntity>> {
  late List<ReadDetailReviewResponseDTO> detailReviewResponses;

  @override
  fromJson(Map<String, dynamic> json) {
    if (json['reviewMaximumResponseList'] != null) {
      detailReviewResponses = List.empty(growable: true);
      json['reviewMaximumResponseList'].forEach((data) {
        detailReviewResponses.add(ReadDetailReviewResponseDTO().fromJson(data));
      });
    }
  }

  @override
  List<DetailReviewEntity> toEntity() =>
      detailReviewResponses.map((e) => e.toEntity()).toList();
}
