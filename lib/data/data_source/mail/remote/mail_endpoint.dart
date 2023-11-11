import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/core/network/http_method.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_endpoint.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_rest_api_domain.dart';
import 'package:mukgen_flutter_v1/data/dto/mail/request/send_mail_auth_code_request_dto.dart';

sealed class MailEndpoint extends MukgenEndpoint {
  MailEndpoint();

  factory MailEndpoint.sendMailAuthCode(
          {required SendMailAuthCodeRequestDTO sendMailAuthCodeRequestDTO}) =
      SendMailAuthCode;

  @override
  BaseRequestDTO? get body => switch (this) {
        SendMailAuthCode(
          sendMailAuthCodeRequestDTO: final sendMailAuthCodeBody
        ) =>
          sendMailAuthCodeBody,
      };

  @override
  MukgenRestAPIDomain get domain => MukgenRestAPIDomain.mail;

  @override
  Map<int, Exception> get errorMap => throw UnimplementedError();

  @override
  HTTPMethod get httpMethod => switch (this) {
        SendMailAuthCode() => HTTPMethod.post,
      };

  @override
  JwtTokenType get jwtTokenType => switch (this) {
        SendMailAuthCode() => JwtTokenType.none,
      };

  @override
  String get path => switch (this) { SendMailAuthCode() => "/mail/send" };

  @override
  Map<String, dynamic>? get queryParam => switch (this) {
        SendMailAuthCode() => null,
      };
}

final class SendMailAuthCode extends MailEndpoint {
  final SendMailAuthCodeRequestDTO sendMailAuthCodeRequestDTO;

  SendMailAuthCode({required this.sendMailAuthCodeRequestDTO});
}
