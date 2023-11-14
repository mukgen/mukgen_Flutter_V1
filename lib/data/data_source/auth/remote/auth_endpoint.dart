import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/core/network/http_method.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_endpoint.dart';
import 'package:mukgen_flutter_v1/core/network/mukgen_rest_api_domain.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/change_password_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/re_issue_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/sign_in_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/sign_up_request_dto.dart';

sealed class AuthEndpoint extends MukgenEndpoint {
  AuthEndpoint();

  factory AuthEndpoint.signIn({required SignInRequestDTO signInRequestDTO}) =
      SignIn;

  factory AuthEndpoint.reIssue({required ReIssueRequestDTO reIssueRequestDTO}) =
      ReIssue;

  factory AuthEndpoint.signUp({required SignUpRequestDTO signUpRequestDTO}) =
      SignUp;

  factory AuthEndpoint.changePassword(
          {required ChangePasswordRequestDTO changePasswordRequestDTO}) =
      ChangePassword;

  factory AuthEndpoint.idDuplicateCheck({required String accountId}) =
      IdDuplicateCheck;

  @override
  BaseRequestDTO? get body => switch (this) {
        SignIn(signInRequestDTO: final signInBody) => signInBody,
        ReIssue(reIssueRequestDTO: final reIssueBody) => reIssueBody,
        SignUp(signUpRequestDTO: final signUpBody) => signUpBody,
        ChangePassword(changePasswordRequestDTO: final changePasswordBody) =>
          changePasswordBody,
        IdDuplicateCheck() => null,
      };

  @override
  MukgenRestAPIDomain get domain => MukgenRestAPIDomain.auth;

  @override
  JwtTokenType get jwtTokenType => switch (this) {
        SignIn() => JwtTokenType.none,
        ReIssue() => JwtTokenType.accessToken,
        SignUp() => JwtTokenType.none,
        ChangePassword() => JwtTokenType.accessToken,
        IdDuplicateCheck() => JwtTokenType.none,
      };

  @override
  Map<int, Exception> get errorMap => throw UnimplementedError();

  @override
  HTTPMethod get httpMethod => switch (this) {
        SignIn() => HTTPMethod.post,
        ReIssue() => HTTPMethod.post,
        SignUp() => HTTPMethod.post,
        ChangePassword() => HTTPMethod.post,
        IdDuplicateCheck() => HTTPMethod.get,
      };

  @override
  String get path => switch (this) {
        SignIn() => "auth/login",
        ReIssue() => "auth/re-issue",
        SignUp() => "auth/signup/general",
        ChangePassword() => "auth/change/password",
        IdDuplicateCheck() => "auth/duplicate",
      };

  @override
  Map<String, dynamic>? get queryParam => switch (this) {
        IdDuplicateCheck(accountId: final accountId) => {
            'accountId': accountId
          },
        SignIn() => null,
        ReIssue() => null,
        SignUp() => null,
        ChangePassword() => null,
      };
}

final class SignIn extends AuthEndpoint {
  final SignInRequestDTO signInRequestDTO;

  SignIn({required this.signInRequestDTO});
}

final class ReIssue extends AuthEndpoint {
  final ReIssueRequestDTO reIssueRequestDTO;

  ReIssue({required this.reIssueRequestDTO});
}

final class SignUp extends AuthEndpoint {
  final SignUpRequestDTO signUpRequestDTO;

  SignUp({required this.signUpRequestDTO});
}

final class ChangePassword extends AuthEndpoint {
  final ChangePasswordRequestDTO changePasswordRequestDTO;

  ChangePassword({required this.changePasswordRequestDTO});
}

final class IdDuplicateCheck extends AuthEndpoint {
  final String accountId;

  IdDuplicateCheck({required this.accountId});
}
