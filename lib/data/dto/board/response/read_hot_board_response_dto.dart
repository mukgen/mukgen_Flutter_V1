import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/response/read_all_board_response_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/board/popular_board_entity.dart';

final class ReadHotBoardResponseDTO
    extends BaseResponseDTO<List<PopularBoardEntity>> {
  late List<BoardPopularResponse> boardPopularResponses;

  ReadHotBoardResponseDTO();

  @override
  fromJson(Map<String, dynamic> json) {
    if (json['boardPopularResponseList'] != null) {
      boardPopularResponses = List.empty(growable: true);
      json['boardPopularResponseList'].forEach((data) {
        boardPopularResponses.add(BoardPopularResponse.fromJson(data));
      });
    }
  }

  @override
  List<PopularBoardEntity> toEntity() =>
      boardPopularResponses.map((e) => e.toEntity()).toList();
}
