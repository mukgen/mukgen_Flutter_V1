import 'package:mukgen_flutter_v1/domain/entity/board/minimum_board_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/board/popular_board_entity.dart';

class BoardListEntity {
  final List<MinimumBoardEntity> minimumBoardEntities;
  final List<PopularBoardEntity> popularBoardEntities;

  BoardListEntity({
    required this.minimumBoardEntities,
    required this.popularBoardEntities,
  });
}
