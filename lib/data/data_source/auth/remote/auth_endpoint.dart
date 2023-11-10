import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/core/network/http_method.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_endpoint.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_rest_api_domain.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/re_issue_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/sign_in_request_dto.dart';

sealed class AuthEndpoint extends MukgenEndpoint {
  AuthEndpoint();

  factory AuthEndpoint.signIn({required SignInRequestDTO signInRequestDTO}) =
      SignIn;

  factory AuthEndpoint.reIssue({required ReIssueRequestDTO reIssueRequestDTO}) =
      ReIssue;

  @override
  BaseRequestDTO? get body => switch (this) {
        SignIn(signInRequestDTO: final signInBody) => signInBody,
        ReIssue(reIssueRequestDTO: final reIssueBody) => reIssueBody,
      };

  @override
  MukgenRestAPIDomain get domain => MukgenRestAPIDomain.auth;

  @override
  JwtTokenType get jwtTokenType => switch (this) {
        SignIn() => JwtTokenType.none,
        ReIssue() => JwtTokenType.accessToken,
      };

  @override
  Map<int, Exception> get errorMap => throw UnimplementedError();

  @override
  HTTPMethod get httpMethod => switch (this) {
        SignIn() => HTTPMethod.post,
        ReIssue() => HTTPMethod.post,
      };

  @override
  String get path =>
      switch (this) { SignIn() => "/login", ReIssue() => "/re-issue" };

  @override
  Map<String, dynamic>? get queryParam => null;
}

final class SignIn extends AuthEndpoint {
  SignInRequestDTO signInRequestDTO;

  SignIn({required this.signInRequestDTO});
}

final class ReIssue extends AuthEndpoint {
  ReIssueRequestDTO reIssueRequestDTO;

  ReIssue({required this.reIssueRequestDTO});
}
