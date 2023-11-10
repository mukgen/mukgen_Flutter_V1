import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';

final class ReIssueRequestDTO extends BaseRequestDTO {
  final String refreshToken;

  ReIssueRequestDTO({required this.refreshToken});

  @override
  Map<String, dynamic> toJson() => {'refreshToken': refreshToken};
}
