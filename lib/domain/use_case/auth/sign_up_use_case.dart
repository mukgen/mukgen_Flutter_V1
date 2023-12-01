import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/sign_up_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/repository/auth_repository/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _authRepository;

  SignUpUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<Result<void, Exception>> execute(
      {required SignUpRequestDTO signUpRequestDTO}) async {
    final res =
        await _authRepository.signUp(signUpRequestDTO: signUpRequestDTO);
    switch (res) {
      case Success():
        return const Success(value: null);
      case Failure(exception: final e):
        return Failure(exception: e);
    }
  }
}
