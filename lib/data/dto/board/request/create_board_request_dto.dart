import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';

final class CreateBoardRequestDTO extends BaseRequestDTO {
  final String title, content;

  CreateBoardRequestDTO({required this.title, required this.content});

  @override
  Map<String, dynamic> toJson() => {'title': title, 'content': content};
}
