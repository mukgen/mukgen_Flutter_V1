import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/sign_in_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/use_case/auth/sign_in_use_case.dart';
import 'package:mukgen_flutter_v1/screen/sign_in/provider/state/sign_in_state.dart';

class SignInViewModel extends StateNotifier<SignInState> {
  final SignInUseCase _signInUseCase;

  SignInViewModel({required SignInUseCase signInUseCase})
      : _signInUseCase = signInUseCase,
        super(SignInState.initial);

  Future<void> signIn({required SignInRequestDTO signInRequestDTO}) async {
    state = SignInState.loading;
    final res =
        await _signInUseCase.execute(signInRequestDTO: signInRequestDTO);
    switch (res) {
      case Success():
        state = SignInState.success;
      case Failure():
        state = SignInState.failure;
    }
  }
}
