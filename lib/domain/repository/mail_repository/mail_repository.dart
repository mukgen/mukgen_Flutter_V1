import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/mail/request/check_mail_auth_code_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/mail/request/send_mail_auth_code_request_dto.dart';

abstract class MailRepository {
  Future<Result<void, Exception>> sendMailAuthCode(
      {required SendMailAuthCodeRequestDTO sendMailAuthCodeRequestDTO});

  Future<Result<void, Exception>> checkMailAuthCode(
      {required CheckMailAuthCodeRequestDTO checkMailAuthCodeRequestDTO});
}
