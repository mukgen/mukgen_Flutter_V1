import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/domain/repository/auth_repository/auth_repository_provider.dart';
import 'package:mukgen_flutter_v1/domain/use_case/auth/sign_in_use_case.dart';

final signInUseCaseProvider = Provider<SignInUseCase>(
    (ref) => SignInUseCase(authRepository: ref.watch(authRepositoryProvider)));
