import 'package:mukgen_flutter_v1/core/network/networking.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/data_source/mail/remote/mail_endpoint.dart';
import 'package:mukgen_flutter_v1/data/dto/mail/request/check_mail_auth_code_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/mail/request/send_mail_auth_code_request_dto.dart';

class RemoteMailDataSource {
  final Networking _networking;

  RemoteMailDataSource({required Networking networking})
      : _networking = networking;

  Future<Result<void, Exception>> sendMailAuthCode(
          {required SendMailAuthCodeRequestDTO
              sendMailAuthCodeRequestDTO}) async =>
      await _networking.noResponseRequest(
          endpoint: MailEndpoint.sendMailAuthCode(
              sendMailAuthCodeRequestDTO: sendMailAuthCodeRequestDTO));

  Future<Result<void, Exception>> checkMailAuthCode(
          {required CheckMailAuthCodeRequestDTO
              checkMailAuthCodeRequestDTO}) async =>
      await _networking.noResponseRequest(
          endpoint: MailEndpoint.checkMailAuthCode(
        checkMailAuthCodeRequestDTO: checkMailAuthCodeRequestDTO,
      ));
}
