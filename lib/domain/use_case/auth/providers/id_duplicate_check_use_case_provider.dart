import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/domain/repository/auth_repository/auth_repository_provider.dart';
import 'package:mukgen_flutter_v1/domain/use_case/auth/id_duplicate_check_use_case.dart';

final idDuplicateCheckUseCaseProvider = Provider<IdDuplicateCheckUseCase>(
    (ref) => IdDuplicateCheckUseCase(
        authRepository: ref.watch(authRepositoryProvider)));
