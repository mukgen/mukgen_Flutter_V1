import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';

final class UpdateBoardRequestDTO extends BaseRequestDTO {
  final String title, content;

  UpdateBoardRequestDTO({required this.title, required this.content});

  @override
  Map<String, dynamic> toJson() => {'title': title, 'content': content};
}
