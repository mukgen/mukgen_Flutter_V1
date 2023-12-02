import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/domain/use_case/mail/providers/send_mail_use_case_provider.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/resend_mail/state/resend_mail_state.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/resend_mail/state/resend_mail_view_model.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/send_mail/state/send_mail_state.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/send_mail/state/send_mail_view_model.dart';

final resendMailViewModelProvider =
StateNotifierProvider<ResendMailViewModel, ResendMailState>((ref) =>
    ResendMailViewModel(sendMailUseCase: ref.watch(sendMainUseCaseProvider)));