import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';

final class CreateCommentRequestDTO extends BaseRequestDTO {
  final int boardId;
  final String content;

  CreateCommentRequestDTO({required this.boardId, required this.content});

  @override
  Map<String, dynamic> toJson() => {'boardId': boardId, 'content': content};
}
