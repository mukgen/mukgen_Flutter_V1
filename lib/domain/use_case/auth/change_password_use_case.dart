import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/change_password_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/repository/auth_repository/auth_repository.dart';

class ChangePasswordUseCase {
  final AuthRepository _authRepository;

  ChangePasswordUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<Result<void, Exception>> execute(
          {required ChangePasswordRequestDTO changePasswordRequestDTO}) =>
      _authRepository.changePassword(
          changePasswordRequestDTO: changePasswordRequestDTO);
}
