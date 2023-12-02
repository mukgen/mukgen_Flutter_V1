import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/domain/use_case/mail/providers/check_mail_use_case_provider.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/check_mail/state/check_mail_state.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/check_mail/state/check_mail_view_model.dart';

final checkMailViewModelProvider =
    StateNotifierProvider<CheckMailViewModel, CheckMailState>((ref) =>
        CheckMailViewModel(checkMailUseCase: ref.watch(checkMainUseCaseProvider)));

final checkMailButtonStateProvider = StateProvider.autoDispose<bool>((ref) => false);
