import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/core/network/http_method.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_endpoint.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_rest_api_domain.dart';
import 'package:mukgen_flutter_v1/data/dto/mail/request/check_mail_auth_code_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/mail/request/send_mail_auth_code_request_dto.dart';

sealed class MailEndpoint extends MukgenEndpoint {
  MailEndpoint();

  factory MailEndpoint.sendMailAuthCode(
          {required SendMailAuthCodeRequestDTO sendMailAuthCodeRequestDTO}) =
      SendMailAuthCode;

  factory MailEndpoint.checkMailAuthCode(
          {required CheckMailAuthCodeRequestDTO checkMailAuthCodeRequestDTO}) =
      CheckMailAuthCode;

  @override
  BaseRequestDTO? get body => switch (this) {
        SendMailAuthCode(
          sendMailAuthCodeRequestDTO: final sendMailAuthCodeBody
        ) =>
          sendMailAuthCodeBody,
        CheckMailAuthCode(
          checkMailAuthCodeRequestDTO: final checkMailAuthCodeBody
        ) =>
          checkMailAuthCodeBody,
      };

  @override
  MukgenRestAPIDomain get domain => MukgenRestAPIDomain.mail;

  @override
  Map<int, Exception> get errorMap => throw UnimplementedError();

  @override
  HTTPMethod get httpMethod => switch (this) {
        SendMailAuthCode() => HTTPMethod.post,
        CheckMailAuthCode() => HTTPMethod.post,
      };

  @override
  JwtTokenType get jwtTokenType => switch (this) {
        SendMailAuthCode() => JwtTokenType.none,
        CheckMailAuthCode() => JwtTokenType.none,
      };

  @override
  String get path => switch (this) {
        SendMailAuthCode() => "/mail/send",
        CheckMailAuthCode() => "/mail/authenticate",
      };

  @override
  Map<String, dynamic>? get queryParam => switch (this) {
        SendMailAuthCode() => null,
        CheckMailAuthCode() => null,
      };
}

final class SendMailAuthCode extends MailEndpoint {
  final SendMailAuthCodeRequestDTO sendMailAuthCodeRequestDTO;

  SendMailAuthCode({required this.sendMailAuthCodeRequestDTO});
}

final class CheckMailAuthCode extends MailEndpoint {
  final CheckMailAuthCodeRequestDTO checkMailAuthCodeRequestDTO;

  CheckMailAuthCode({required this.checkMailAuthCodeRequestDTO});
}
