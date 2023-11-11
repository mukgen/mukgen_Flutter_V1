import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/core/network/http_method.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_endpoint.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_rest_api_domain.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/create_board_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/create_comment_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/update_board_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/update_comment_request_dto.dart';

sealed class BoardEndpoint extends MukgenEndpoint {
  BoardEndpoint();

  factory BoardEndpoint.createBoard(
      {required CreateBoardRequestDTO createBoardRequestDTO}) = CreateBoard;

  factory BoardEndpoint.updateBoard(
      {required int boardId,
      required UpdateBoardRequestDTO updateBoardRequestDTO}) = UpdateBoard;

  factory BoardEndpoint.deleteBoard({required int boardId}) = DeleteBoard;

  factory BoardEndpoint.readAllBoard() = ReadAllBoard;

  factory BoardEndpoint.readHotBoard() = ReadHotBoard;

  factory BoardEndpoint.readTodayBoard() = ReadTodayBoard;

  factory BoardEndpoint.readThisWeekBoard() = ReadThisWeekBoard;

  factory BoardEndpoint.readDetailBoard({required int boardId}) =
      ReadDetailBoard;

  factory BoardEndpoint.addBoardLike({required int boardId}) = AddBoardLike;

  factory BoardEndpoint.createComment(
          {required CreateCommentRequestDTO createCommentRequestDTO}) =
      CreateComment;

  factory BoardEndpoint.updateComment(
          {required int boardCommentId,
          required UpdateCommentRequestDTO updateCommentRequestDTO}) =
      UpdateComment;

  @override
  BaseRequestDTO? get body => switch (this) {
        CreateBoard(createBoardRequestDTO: final createBoardBody) =>
          createBoardBody,
        UpdateBoard(updateBoardRequestDTO: final updateBoardBody) =>
          updateBoardBody,
        DeleteBoard() => null,
        ReadAllBoard() => null,
        ReadHotBoard() => null,
        ReadTodayBoard() => null,
        ReadThisWeekBoard() => null,
        ReadDetailBoard() => null,
        AddBoardLike() => null,
        CreateComment(createCommentRequestDTO: final createCommentBody) =>
          createCommentBody,
        UpdateComment(updateCommentRequestDTO: final updateCommentBody) =>
          updateCommentBody,
      };

  @override
  MukgenRestAPIDomain get domain => MukgenRestAPIDomain.board;

  @override
  Map<int, Exception> get errorMap => throw UnimplementedError();

  @override
  HTTPMethod get httpMethod => switch (this) {
        CreateBoard() => HTTPMethod.post,
        UpdateBoard() => HTTPMethod.put,
        DeleteBoard() => HTTPMethod.delete,
        ReadAllBoard() => HTTPMethod.get,
        ReadHotBoard() => HTTPMethod.get,
        ReadTodayBoard() => HTTPMethod.get,
        ReadThisWeekBoard() => HTTPMethod.get,
        ReadDetailBoard() => HTTPMethod.get,
        AddBoardLike() => HTTPMethod.post,
        CreateComment() => HTTPMethod.post,
        UpdateComment() => HTTPMethod.put,
      };

  @override
  JwtTokenType get jwtTokenType => switch (this) {
        CreateBoard() => JwtTokenType.accessToken,
        UpdateBoard() => JwtTokenType.accessToken,
        DeleteBoard() => JwtTokenType.accessToken,
        ReadAllBoard() => JwtTokenType.accessToken,
        ReadHotBoard() => JwtTokenType.accessToken,
        ReadTodayBoard() => JwtTokenType.accessToken,
        ReadThisWeekBoard() => JwtTokenType.accessToken,
        ReadDetailBoard() => JwtTokenType.accessToken,
        AddBoardLike() => JwtTokenType.accessToken,
        CreateComment() => JwtTokenType.accessToken,
        UpdateComment() => JwtTokenType.accessToken,
      };

  @override
  String get path => switch (this) {
        CreateBoard() => "/board/",
        UpdateBoard(boardId: final boardId) => "/board/$boardId",
        DeleteBoard(boardId: final boardId) => "/board/$boardId",
        ReadAllBoard() => "/board/total",
        ReadHotBoard() => "/board/hot",
        ReadTodayBoard() => "/board/day",
        ReadThisWeekBoard() => "board/week",
        ReadDetailBoard(boardId: final boardId) => "/board/$boardId",
        AddBoardLike(boardId: final boardId) => "/board/$boardId",
        CreateComment() => "/board-comment",
        UpdateComment(boardCommentId: final boardCommentId) =>
          "/board-comment/$boardCommentId",
      };

  @override
  Map<String, dynamic>? get queryParam => null;
}

final class CreateBoard extends BoardEndpoint {
  final CreateBoardRequestDTO createBoardRequestDTO;

  CreateBoard({required this.createBoardRequestDTO});
}

final class UpdateBoard extends BoardEndpoint {
  final int boardId;
  final UpdateBoardRequestDTO updateBoardRequestDTO;

  UpdateBoard({required this.boardId, required this.updateBoardRequestDTO});
}

final class DeleteBoard extends BoardEndpoint {
  final int boardId;

  DeleteBoard({required this.boardId});
}

final class ReadAllBoard extends BoardEndpoint {}

final class ReadHotBoard extends BoardEndpoint {}

final class ReadTodayBoard extends BoardEndpoint {}

final class ReadThisWeekBoard extends BoardEndpoint {}

final class ReadDetailBoard extends BoardEndpoint {
  final int boardId;

  ReadDetailBoard({required this.boardId});
}

final class AddBoardLike extends BoardEndpoint {
  final int boardId;

  AddBoardLike({required this.boardId});
}

final class CreateComment extends BoardEndpoint {
  final CreateCommentRequestDTO createCommentRequestDTO;

  CreateComment({required this.createCommentRequestDTO});
}

final class UpdateComment extends BoardEndpoint {
  final int boardCommentId;
  final UpdateCommentRequestDTO updateCommentRequestDTO;

  UpdateComment(
      {required this.boardCommentId, required this.updateCommentRequestDTO});
}
