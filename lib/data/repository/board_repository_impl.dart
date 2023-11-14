import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/data_source/board/remote/remote_board_data_source.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/create_board_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/create_comment_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/update_board_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/update_comment_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/board/board_list_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/board/detail_board_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/board/popular_board_entity.dart';
import 'package:mukgen_flutter_v1/domain/repository/board_repository.dart';

class BoardRepositoryImpl extends BoardRepository {
  final RemoteBoardDataSource _remoteBoardDataSource;

  BoardRepositoryImpl({required RemoteBoardDataSource remoteBoardDataSource})
      : _remoteBoardDataSource = remoteBoardDataSource;

  @override
  Future<Result<int, Exception>> addBoardLike({required int boardId}) =>
      _remoteBoardDataSource.addBoardLike(boardId: boardId);

  @override
  Future<Result<void, Exception>> createBoard(
          {required CreateBoardRequestDTO createBoardRequestDTO}) =>
      _remoteBoardDataSource.createBoard(
          createBoardRequestDTO: createBoardRequestDTO);

  @override
  Future<Result<void, Exception>> createComment(
          {required CreateCommentRequestDTO createCommentRequestDTO}) =>
      _remoteBoardDataSource.createComment(
          createCommentRequestDTO: createCommentRequestDTO);

  @override
  Future<Result<void, Exception>> deleteBoard({required int boardId}) =>
      _remoteBoardDataSource.deleteBoard(boardId: boardId);

  @override
  Future<Result<void, Exception>> deleteComment(
          {required int boardCommentId}) =>
      _remoteBoardDataSource.deleteComment(boardCommentId: boardCommentId);

  @override
  Future<Result<BoardListEntity, Exception>> readAllBoard() =>
      _remoteBoardDataSource.readAllBoard();

  @override
  Future<Result<DetailBoardEntity, Exception>> readDetailBoard(
          {required int boardId}) =>
      _remoteBoardDataSource.readDetailBoard(boardId: boardId);

  @override
  Future<Result<List<PopularBoardEntity>, Exception>> readHotBoard() =>
      _remoteBoardDataSource.readHotBoard();

  @override
  Future<Result<BoardListEntity, Exception>> readTodayBoard() =>
      _remoteBoardDataSource.readTodayBoard();

  @override
  Future<Result<BoardListEntity, Exception>> readWeekBoard() =>
      _remoteBoardDataSource.readWeekBoard();

  @override
  Future<Result<void, Exception>> updateBoard(
          {required int boardId,
          required UpdateBoardRequestDTO updateBoardRequestDTO}) =>
      _remoteBoardDataSource.updateBoard(
          boardId: boardId, updateBoardRequestDTO: updateBoardRequestDTO);

  @override
  Future<Result<void, Exception>> updateComment(
          {required int boardCommentId,
          required UpdateCommentRequestDTO updateCommentRequestDTO}) =>
      _remoteBoardDataSource.updateComment(
          boardCommentId: boardCommentId,
          updateCommentRequestDTO: updateCommentRequestDTO);
}
