import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/core/network/http_method.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_endpoint.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_rest_api_domain.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/create_board_request_dto.dart';

sealed class BoardEndpoint extends MukgenEndpoint {
  BoardEndpoint();

  factory BoardEndpoint.createBoard(
      {required CreateBoardRequestDTO createBoardRequestDTO}) = CreateBoard;

  @override
  BaseRequestDTO? get body => switch (this) {
        CreateBoard(createBoardRequestDTO: final createBoardBody) =>
          createBoardBody,
      };

  @override
  MukgenRestAPIDomain get domain => MukgenRestAPIDomain.board;

  @override
  Map<int, Exception> get errorMap => throw UnimplementedError();

  @override
  HTTPMethod get httpMethod => switch (this) {
        CreateBoard() => HTTPMethod.post,
      };

  @override
  JwtTokenType get jwtTokenType => switch (this) {
        CreateBoard() => JwtTokenType.accessToken,
      };

  @override
  String get path => switch (this) { CreateBoard() => "/board/" };

  @override
  Map<String, dynamic>? get queryParam => null;
}

final class CreateBoard extends BoardEndpoint {
  final CreateBoardRequestDTO createBoardRequestDTO;

  CreateBoard({required this.createBoardRequestDTO});
}
