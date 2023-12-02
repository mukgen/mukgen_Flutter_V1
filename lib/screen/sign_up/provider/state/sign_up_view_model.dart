import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/sign_up_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/use_case/auth/sign_up_use_case.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/state/sign_up_state.dart';

class SignUpViewModel extends StateNotifier<SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpViewModel({required SignUpUseCase signUpUseCase})
      : _signUpUseCase = signUpUseCase,
        super(SignUpState.initial);

  Future<void> signUp({required SignUpRequestDTO signUpRequestDTO}) async {
    state = SignUpState.loading;
    final res =
        await _signUpUseCase.execute(signUpRequestDTO: signUpRequestDTO);
    switch (res) {
      case Success():
        state = SignUpState.success;
      case Failure():
        state = SignUpState.failure;
    }
  }
}
