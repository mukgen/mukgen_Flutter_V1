import 'package:mukgen_flutter_v1/domain/repository/auth_repository.dart';

class LogOutUseCase {
  final AuthRepository _authRepository;

  LogOutUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<void> execute() => _authRepository.logOut();
}
