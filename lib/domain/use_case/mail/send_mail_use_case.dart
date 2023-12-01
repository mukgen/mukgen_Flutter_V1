import 'package:flutter/cupertino.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/sign_up_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/mail/request/send_mail_auth_code_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/repository/auth_repository/auth_repository.dart';
import 'package:mukgen_flutter_v1/domain/repository/mail_repository/mail_repository.dart';

class SendMailUseCase {
  final MailRepository _mailRepository;

  SendMailUseCase({required MailRepository mailRepository})
      : _mailRepository = mailRepository;

  Future<Result<void, Exception>> execute({required SendMailAuthCodeRequestDTO sendMailAuthCodeRequestDTO}) async {
    final res = await _mailRepository.sendMailAuthCode(sendMailAuthCodeRequestDTO: sendMailAuthCodeRequestDTO);
    switch (res) {
      case Success():
        return const Success(value: null);
      case Failure(exception: final e):
        return Failure(exception: e);
    }
  }
}
