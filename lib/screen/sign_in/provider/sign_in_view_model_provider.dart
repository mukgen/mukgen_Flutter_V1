import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/domain/use_case/auth/providers/sign_in_use_case_provider.dart';
import 'package:mukgen_flutter_v1/screen/sign_in/provider/state/sign_in_state.dart';
import 'package:mukgen_flutter_v1/screen/sign_in/provider/state/sign_in_view_model.dart';

final signInViewModelProvider =
    StateNotifierProvider<SignInViewModel, SignInState>((ref) =>
        SignInViewModel(signInUseCase: ref.watch(signInUseCaseProvider)));
