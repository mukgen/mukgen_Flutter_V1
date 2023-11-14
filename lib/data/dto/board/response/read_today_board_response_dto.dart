import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/response/read_all_board_response_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/board/board_list_entity.dart';

final class ReadTodayBoardResponseDTO extends BaseResponseDTO<BoardListEntity> {
  late List<BoardPopularResponse> boardPopularResponses;
  late List<BoardMinimumResponse> boardMinimumResponses;

  ReadTodayBoardResponseDTO();

  @override
  fromJson(Map<String, dynamic> json) {
    if (json['boardListResponse']['boardMinimumResponseList'] != null) {
      boardMinimumResponses = List.empty(growable: true);
      json['boardListResponse']['boardMinimumResponseList'].forEach((data) {
        boardMinimumResponses.add(BoardMinimumResponse.fromJson(data));
      });
    }
    if (json['boardPopularListResponse']['boardPopularResponseList'] != null) {
      boardPopularResponses = List.empty(growable: true);
      json['boardPopularListResponse']['boardPopularResponseList']
          .forEach((data) {
        boardPopularResponses.add(BoardPopularResponse.fromJson(data));
      });
    }
  }

  @override
  BoardListEntity toEntity() => BoardListEntity(
        minimumBoardEntities:
            boardMinimumResponses.map((e) => e.toEntity()).toList(),
        popularBoardEntities:
            boardPopularResponses.map((e) => e.toEntity()).toList(),
      );
}
