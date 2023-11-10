import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';

final class SignUpRequestDTO extends BaseRequestDTO {
  final String nickname, accountId, password, passwordCheck, phoneNumber, mail;

  SignUpRequestDTO(
      {required this.accountId,
      required this.password,
      required this.mail,
      required this.nickname,
      required this.passwordCheck,
      required this.phoneNumber});

  @override
  Map<String, dynamic> toJson() => {
        'accountId': accountId,
        'password': password,
        'mail': mail,
        'nickname': nickname,
        'passwordCheck': passwordCheck,
        'phoneNumber': phoneNumber,
      };
}
