import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/core/network/http_method.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_endpoint.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_rest_api_domain.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/create_board_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/update_board_request_dto.dart';

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
