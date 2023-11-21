import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/change_password_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/re_issue_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/sign_in_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/sign_up_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/auth/jwt_token_entity.dart';

abstract class AuthRepository {
  Future<Result<JWTTokenEntity, Exception>> signIn(
      {required SignInRequestDTO signInRequestDTO});

  Future<Result<JWTTokenEntity, Exception>> reIssue(
      {required ReIssueRequestDTO reIssueRequestDTO});

  Future<Result<void, Exception>> signUp(
      {required SignUpRequestDTO signUpRequestDTO});

  Future<Result<void, Exception>> changePassword(
      {required ChangePasswordRequestDTO changePasswordRequestDTO});

  Future<Result<bool, Exception>> idDuplicateCheck({required String accountId});

  Future<void> tokenSave({required JWTTokenEntity jwtTokenEntity});

  Future<void> logOut();
}
