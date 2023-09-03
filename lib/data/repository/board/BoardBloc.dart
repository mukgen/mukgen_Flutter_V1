import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mukgen_flutter_v1/model/board/minimum_board.dart';

class BoardBloc extends Bloc<BoardEvent, BoardMinimum> {
  BoardBloc(): super(BoardMinimum()) {
    on<CreateBoardEvent>(createBoard);
  }

  FutureOr<void> createBoard(CreateBoardEvent event, Emitter<BoardMinimum> emit){
    final BoardMinimum boardMinimum = BoardMinimum(
      title: event.title,
      content: event.content,
      userNickname: event.userNickname,
      likeCount: event.likeCount,
      commentCount: event.commentCount,
      viewCount: event.commentCount,
      createdAt: event.createdAt,
      updatedAt: event.updatedAt,
      updated: event.updated
    );
    emit(boardMinimum);
  }
}


abstract class BoardEvent {}

class CreateBoardEvent extends BoardEvent {

  final String title;
  final String content;
  final String userNickname;
  final int likeCount;
  final int commentCount;
  final int viewCount;
  final String createdAt;
  final String updatedAt;
  final bool updated;

  CreateBoardEvent({
      required this.title,
      required this.content,
      required this.userNickname,
      required this.likeCount,
      required this.commentCount,
      required this.viewCount,
      required this.createdAt,
      required this.updatedAt,
      required this.updated
  });
}