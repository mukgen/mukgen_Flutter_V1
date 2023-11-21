import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';

final class AddBoardLikeResponseDTO extends BaseResponseDTO<int> {
  late final int boardLike;

  AddBoardLikeResponseDTO();

  factory AddBoardLikeResponseDTO.fromJson(Map<String, dynamic> json) =>
      AddBoardLikeResponseDTO()..boardLike = json['boardLike'];

  @override
  fromJson(Map<String, dynamic> json) => AddBoardLikeResponseDTO.fromJson(json);

  @override
  int toEntity() => boardLike;
}
