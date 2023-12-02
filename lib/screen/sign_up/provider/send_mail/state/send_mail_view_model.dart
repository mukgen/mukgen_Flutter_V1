import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/mail/request/send_mail_auth_code_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/use_case/mail/send_mail_use_case.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/send_mail/state/send_mail_state.dart';

class SendMailViewModel extends StateNotifier<SendMailState> {
  final SendMailUseCase _sendMailUseCase;

  SendMailViewModel({required SendMailUseCase sendMailUseCase})
      : _sendMailUseCase = sendMailUseCase,
        super(SendMailState.initial);

  Future<void> sendMailAuthCode({required SendMailAuthCodeRequestDTO sendMailAuthCodeRequestDTO}) async {
    state = SendMailState.loading;
    final res =
    await _sendMailUseCase.execute(sendMailAuthCodeRequestDTO: sendMailAuthCodeRequestDTO);
    switch (res) {
      case Success():
        state = SendMailState.success;
      case Failure():
        state = SendMailState.failure;
    }
  }
}