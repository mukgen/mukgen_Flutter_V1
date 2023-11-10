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

  @override
  BaseRequestDTO? get body => switch (this) {
        CreateBoard(createBoardRequestDTO: final createBoardBody) =>
          createBoardBody,
        UpdateBoard(updateBoardRequestDTO: final updateBoardBody) =>
          updateBoardBody,
      };

  @override
  MukgenRestAPIDomain get domain => MukgenRestAPIDomain.board;

  @override
  Map<int, Exception> get errorMap => throw UnimplementedError();

  @override
  HTTPMethod get httpMethod => switch (this) {
        CreateBoard() => HTTPMethod.post,
        UpdateBoard() => HTTPMethod.put,
      };

  @override
  JwtTokenType get jwtTokenType => switch (this) {
        CreateBoard() => JwtTokenType.accessToken,
        UpdateBoard() => JwtTokenType.accessToken,
      };

  @override
  String get path => switch (this) {
        CreateBoard() => "/board/",
        UpdateBoard(boardId: final boardId) => "/board/$boardId",
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
