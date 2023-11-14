import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';

final class SignInRequestDTO extends BaseRequestDTO {
  final String accountId;
  final String password;

  SignInRequestDTO({required this.accountId, required this.password});

  @override
  Map<String, dynamic> toJson() => {'id': accountId, 'password': password};
}
