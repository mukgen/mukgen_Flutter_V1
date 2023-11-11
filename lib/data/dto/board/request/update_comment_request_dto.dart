import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';

final class UpdateCommentRequestDTO extends BaseRequestDTO {
  final String content;

  UpdateCommentRequestDTO({required this.content});

  @override
  Map<String, dynamic> toJson() => {'content': content};
}
