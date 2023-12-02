import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/mail/request/check_mail_auth_code_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/repository/mail_repository/mail_repository.dart';

class CheckMailUseCase {
  final MailRepository _mailRepository;

  CheckMailUseCase({required MailRepository mailRepository})
      : _mailRepository = mailRepository;

  Future<Result<void, Exception>> execute(
          {required CheckMailAuthCodeRequestDTO checkMailAuthCodeRequestDTO}) =>
      _mailRepository.checkMailAuthCode(
          checkMailAuthCodeRequestDTO: checkMailAuthCodeRequestDTO);
}
