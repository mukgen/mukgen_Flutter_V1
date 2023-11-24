import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/sign_in_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/repository/auth_repository/auth_repository.dart';

class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<Result<void, Exception>> execute(
      {required SignInRequestDTO signInRequestDTO}) async {
    final res =
        await _authRepository.signIn(signInRequestDTO: signInRequestDTO);
    switch (res) {
      case Success(value: final value):
        await _authRepository.tokenSave(jwtTokenEntity: value);
        return const Success(value: null);
      case Failure(exception: final e):
        return Failure(exception: e);
    }
  }
}
