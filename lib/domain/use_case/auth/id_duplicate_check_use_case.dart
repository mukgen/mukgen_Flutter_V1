import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/domain/repository/auth_repository/auth_repository.dart';

class IdDuplicateCheckUseCase {
  final AuthRepository _authRepository;

  IdDuplicateCheckUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<Result<bool, Exception>> execute({required String accountId}) async {
    final res = await _authRepository.idDuplicateCheck(accountId: accountId);
    switch (res) {
      case Success(value: final value):
        return Success(value: value);
      case Failure(exception: final e):
        return Failure(exception: e);
    }
  }
}
