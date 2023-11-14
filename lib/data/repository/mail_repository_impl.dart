import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/data_source/mail/remote/remote_mail_data_source.dart';
import 'package:mukgen_flutter_v1/data/dto/mail/request/check_mail_auth_code_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/mail/request/send_mail_auth_code_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/repository/mail_repository.dart';

class MailRepositoryImpl extends MailRepository {
  final RemoteMailDataSource _remoteMailDataSource;

  MailRepositoryImpl({required RemoteMailDataSource remoteMailDataSource})
      : _remoteMailDataSource = remoteMailDataSource;

  @override
  Future<Result<void, Exception>> checkMailAuthCode(
          {required CheckMailAuthCodeRequestDTO checkMailAuthCodeRequestDTO}) =>
      _remoteMailDataSource.checkMailAuthCode(
          checkMailAuthCodeRequestDTO: checkMailAuthCodeRequestDTO);

  @override
  Future<Result<void, Exception>> sendMailAuthCode(
          {required SendMailAuthCodeRequestDTO sendMailAuthCodeRequestDTO}) =>
      _remoteMailDataSource.sendMailAuthCode(
          sendMailAuthCodeRequestDTO: sendMailAuthCodeRequestDTO);
}
