import 'package:mukgen_flutter_v1/core/network/networking.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/data_source/board/remote/board_endpoint.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/create_board_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/create_comment_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/update_board_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/request/update_comment_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/response/add_board_like_response_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/response/read_all_board_response_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/response/read_detail_board_response_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/response/read_hot_board_response_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/response/read_this_week_board_response_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/board/response/read_today_board_response_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/board/board_list_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/board/detail_board_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/board/popular_board_entity.dart';

class RemoteBoardDataSource {
  final Networking _networking;

  RemoteBoardDataSource({required Networking networking})
      : _networking = networking;

  Future<Result<void, Exception>> createBoard(
          {required CreateBoardRequestDTO createBoardRequestDTO}) async =>
      await _networking.noResponseRequest(
          endpoint: BoardEndpoint.createBoard(
        createBoardRequestDTO: createBoardRequestDTO,
      ));

  Future<Result<void, Exception>> updateBoard(
          {required int boardId,
          required UpdateBoardRequestDTO updateBoardRequestDTO}) async =>
      await _networking.noResponseRequest(
          endpoint: BoardEndpoint.updateBoard(
              boardId: boardId, updateBoardRequestDTO: updateBoardRequestDTO));

  Future<Result<void, Exception>> deleteBoard({required int boardId}) async =>
      await _networking.noResponseRequest(
          endpoint: BoardEndpoint.deleteBoard(boardId: boardId));

  Future<Result<BoardListEntity, Exception>> readAllBoard() async {
    final res = await _networking
        .request<ReadAllBoardResponseDTO, ReadAllBoardResponseDTO>(
            endpoint: BoardEndpoint.readAllBoard(),
            responseType: ReadAllBoardResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }

  Future<Result<List<PopularBoardEntity>, Exception>> readHotBoard() async {
    final res = await _networking
        .request<ReadHotBoardResponseDTO, ReadHotBoardResponseDTO>(
            endpoint: BoardEndpoint.readHotBoard(),
            responseType: ReadHotBoardResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }

  Future<Result<BoardListEntity, Exception>> readTodayBoard() async {
    final res = await _networking
        .request<ReadTodayBoardResponseDTO, ReadTodayBoardResponseDTO>(
            endpoint: BoardEndpoint.readAllBoard(),
            responseType: ReadTodayBoardResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }

  Future<Result<BoardListEntity, Exception>> readWeekBoard() async {
    final res = await _networking
        .request<ReadThisWeekBoardResponseDTO, ReadThisWeekBoardResponseDTO>(
            endpoint: BoardEndpoint.readAllBoard(),
            responseType: ReadThisWeekBoardResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }

  Future<Result<DetailBoardEntity, Exception>> readDetailBoard(
      {required int boardId}) async {
    final res = await _networking
        .request<ReadDetailBoardResponseDTO, ReadDetailBoardResponseDTO>(
            endpoint: BoardEndpoint.readDetailBoard(boardId: boardId),
            responseType: ReadDetailBoardResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }

  Future<Result<int, Exception>> addBoardLike({required int boardId}) async {
    final res = await _networking
        .request<AddBoardLikeResponseDTO, AddBoardLikeResponseDTO>(
            endpoint: BoardEndpoint.addBoardLike(boardId: boardId),
            responseType: AddBoardLikeResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }

  Future<Result<void, Exception>> createComment(
          {required CreateCommentRequestDTO createCommentRequestDTO}) async =>
      await _networking.noResponseRequest(
          endpoint: BoardEndpoint.createComment(
              createCommentRequestDTO: createCommentRequestDTO));

  Future<Result<void, Exception>> updateComment(
          {required int boardCommentId,
          required UpdateCommentRequestDTO updateCommentRequestDTO}) async =>
      await _networking.noResponseRequest(
          endpoint: BoardEndpoint.updateComment(
              boardCommentId: boardCommentId,
              updateCommentRequestDTO: updateCommentRequestDTO));

  Future<Result<void, Exception>> deleteComment(
          {required int boardCommentId}) async =>
      await _networking.noResponseRequest(
          endpoint:
              BoardEndpoint.deleteComment(boardCommentId: boardCommentId));
}
