import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/domain/repository/auth_repository/auth_repository.dart';

class IdDuplicateCheckUseCase {
  final AuthRepository _authRepository;

  IdDuplicateCheckUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<Result<void, Exception>> execute({required String accountId}) =>
      _authRepository.idDuplicateCheck(accountId: accountId);
}
