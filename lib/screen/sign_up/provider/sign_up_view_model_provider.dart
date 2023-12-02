import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/domain/use_case/auth/providers/sign_up_use_case_provider.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/state/sign_up_state.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/state/sign_up_view_model.dart';

final signUpViewModelProvider =
StateNotifierProvider<SignUpViewModel, SignUpState>((ref) =>
    SignUpViewModel(signUpUseCase: ref.watch(signUpUseCaseProvider)));

