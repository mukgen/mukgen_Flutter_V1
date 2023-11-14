import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/board/board_comment_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/board/detail_board_entity.dart';

final class ReadDetailBoardResponseDTO
    extends BaseResponseDTO<DetailBoardEntity> {
  late final int likeCount, commentCount, viewCount;
  late final String title, content, userNickname, createdAt, updatedAt;
  late final List<String> likeUserNicknames;
  late final List<BoardCommentResponse> boardCommentResponses;

  ReadDetailBoardResponseDTO();

  @override
  fromJson(Map<String, dynamic> json) {
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
    viewCount = json['viewCount'];
    title = json['title'];
    content = json['content'];
    userNickname = json['userNickname'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['likeResponseList'] != null) {
      likeUserNicknames = List.empty(growable: true);
      json['likeResponseList'].forEach((data) {
        likeUserNicknames.add(data['userNickname']);
      });
    }
    if (json['boardCommentList'] != null) {
      boardCommentResponses = List.empty(growable: true);
      json['boardCommentList'].forEach((data) {
        boardCommentResponses.add(BoardCommentResponse.fromJson(data));
      });
    }
  }

  @override
  DetailBoardEntity toEntity() => DetailBoardEntity(
        likeCount: likeCount,
        commentCount: commentCount,
        viewCount: viewCount,
        title: title,
        content: content,
        userNickname: userNickname,
        createdAt: createdAt,
        updatedAt: updatedAt,
        userNicknames: likeUserNicknames,
        boardCommentEntities:
            boardCommentResponses.map((e) => e.toEntity()).toList(),
      );
}

final class BoardCommentResponse extends BaseResponseDTO<BoardCommentEntity> {
  late final int boardCommentId;
  late final String writer, content, createdAt;

  BoardCommentResponse();

  factory BoardCommentResponse.fromJson(Map<String, dynamic> json) =>
      BoardCommentResponse()
        ..boardCommentId = json['boardCommentId']
        ..writer = json['writer']
        ..content = json['content']
        ..createdAt = json['createdAt'];

  @override
  fromJson(Map<String, dynamic> json) => BoardCommentResponse.fromJson(json);

  @override
  BoardCommentEntity toEntity() => BoardCommentEntity(
        boardCommentId: boardCommentId,
        writer: writer,
        content: content,
        createdAt: createdAt,
      );
}
