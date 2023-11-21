import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';

final class SendMailAuthCodeRequestDTO extends BaseRequestDTO {
  final String mail;

  SendMailAuthCodeRequestDTO({required this.mail});

  @override
  Map<String, dynamic> toJson() => {'mail': mail};
}
