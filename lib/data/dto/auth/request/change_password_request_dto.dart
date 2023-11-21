import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';

final class ChangePasswordRequestDTO extends BaseRequestDTO {
  final String oldPassword, newPassword;

  ChangePasswordRequestDTO(
      {required this.oldPassword, required this.newPassword});

  @override
  Map<String, dynamic> toJson() => {
        'old_password': oldPassword,
        'new_password': newPassword,
      };
}
