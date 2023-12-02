import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/mail/request/check_mail_auth_code_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/use_case/mail/check_mail_use_case.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/check_mail/state/check_mail_state.dart';

class CheckMailViewModel extends StateNotifier<CheckMailState> {
  final CheckMailUseCase _checkMailUseCase;

  CheckMailViewModel({required CheckMailUseCase checkMailUseCase})
      : _checkMailUseCase = checkMailUseCase,
        super(CheckMailState.initial);

  Future<void> checkMailAuthCode({required CheckMailAuthCodeRequestDTO checkMailAuthCodeRequestDTO}) async {
    state = CheckMailState.loading;
    final res =
    await _checkMailUseCase.execute(checkMailAuthCodeRequestDTO: checkMailAuthCodeRequestDTO);
    switch (res) {
      case Success():
        state = CheckMailState.success;
      case Failure():
        state = CheckMailState.failure;
    }
  }
}