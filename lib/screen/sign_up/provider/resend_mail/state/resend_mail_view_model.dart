import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/mail/request/send_mail_auth_code_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/use_case/mail/send_mail_use_case.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/resend_mail/state/resend_mail_state.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/send_mail/state/send_mail_state.dart';

class ResendMailViewModel extends StateNotifier<ResendMailState> {
  final SendMailUseCase _sendMailUseCase;

  ResendMailViewModel({required SendMailUseCase sendMailUseCase})
      : _sendMailUseCase = sendMailUseCase,
        super(ResendMailState.initial);

  Future<void> resendMailAuthCode({required SendMailAuthCodeRequestDTO sendMailAuthCodeRequestDTO}) async {
    state = ResendMailState.loading;
    final res =
    await _sendMailUseCase.execute(sendMailAuthCodeRequestDTO: sendMailAuthCodeRequestDTO);
    switch (res) {
      case Success():
        state = ResendMailState.success;
      case Failure():
        state = ResendMailState.failure;
    }
  }
}