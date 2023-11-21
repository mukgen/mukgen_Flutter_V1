import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/create_board_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/create_comment_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/update_board_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/update_comment_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/board/board_list_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/board/detail_board_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/board/popular_board_entity.dart';

abstract class BoardRepository {
  Future<Result<void, Exception>> createBoard(
      {required CreateBoardRequestDTO createBoardRequestDTO});

  Future<Result<void, Exception>> updateBoard(
      {required int boardId,
      required UpdateBoardRequestDTO updateBoardRequestDTO});

  Future<Result<void, Exception>> deleteBoard({required int boardId});

  Future<Result<BoardListEntity, Exception>> readAllBoard();

  Future<Result<List<PopularBoardEntity>, Exception>> readHotBoard();

  Future<Result<BoardListEntity, Exception>> readTodayBoard();

  Future<Result<BoardListEntity, Exception>> readWeekBoard();

  Future<Result<DetailBoardEntity, Exception>> readDetailBoard(
      {required int boardId});

  Future<Result<int, Exception>> addBoardLike({required int boardId});

  Future<Result<void, Exception>> createComment(
      {required CreateCommentRequestDTO createCommentRequestDTO});

  Future<Result<void, Exception>> updateComment(
      {required int boardCommentId,
      required UpdateCommentRequestDTO updateCommentRequestDTO});

  Future<Result<void, Exception>> deleteComment({required int boardCommentId});
}
