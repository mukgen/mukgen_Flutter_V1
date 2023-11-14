import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';

final class CheckMailAuthCodeRequestDTO extends BaseRequestDTO {
  final String mail, code;

  CheckMailAuthCodeRequestDTO({required this.mail, required this.code});

  @override
  Map<String, dynamic> toJson() => {'mail': mail, 'code': code};
}
