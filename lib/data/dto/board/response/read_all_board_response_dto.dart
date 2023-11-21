import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/board/board_list_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/board/minimum_board_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/board/popular_board_entity.dart';

final class ReadAllBoardResponseDTO extends BaseResponseDTO<BoardListEntity> {
  late List<BoardPopularResponse> boardPopularResponses;
  late List<BoardMinimumResponse> boardMinimumResponses;

  ReadAllBoardResponseDTO();

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

final class BoardMinimumResponse extends BaseResponseDTO<MinimumBoardEntity> {
  late final int boardId, likeCount, commentCount, viewCount;
  late final String title, content, userNickname, createdAt, updatedAt;
  late final bool updated, isLiked;

  BoardMinimumResponse();

  factory BoardMinimumResponse.fromJson(Map<String, dynamic> json) =>
      BoardMinimumResponse()
        ..boardId = json['boardId']
        ..likeCount = json['likeCount']
        ..commentCount = json['commentCount']
        ..viewCount = json['viewCount']
        ..title = json['title']
        ..content = json['content']
        ..userNickname = json['userNickname']
        ..createdAt = json['createdAt']
        ..updatedAt = json['updatedAt']
        ..updated = json['updated']
        ..isLiked = json['isLiked'];

  @override
  fromJson(Map<String, dynamic> json) => BoardMinimumResponse.fromJson(json);

  @override
  MinimumBoardEntity toEntity() => MinimumBoardEntity(
        boardId: boardId,
        likeCount: likeCount,
        commentCount: commentCount,
        title: title,
        content: content,
        userNickname: userNickname,
        createdAt: createdAt,
        updatedAt: updatedAt,
        updated: updated,
        isLiked: isLiked,
      );
}

final class BoardPopularResponse extends BaseResponseDTO<PopularBoardEntity> {
  late final int boardId, commentCount, viewCount;
  late final String title;

  BoardPopularResponse();

  factory BoardPopularResponse.fromJson(Map<String, dynamic> json) =>
      BoardPopularResponse()
        ..boardId = json['boardId']
        ..commentCount = json['commentCount']
        ..viewCount = json['viewCount']
        ..title = json['title'];

  @override
  fromJson(Map<String, dynamic> json) => BoardPopularResponse.fromJson(json);

  @override
  PopularBoardEntity toEntity() => PopularBoardEntity(
        boardId: boardId,
        commentCount: commentCount,
        viewCount: viewCount,
        title: title,
      );
}
