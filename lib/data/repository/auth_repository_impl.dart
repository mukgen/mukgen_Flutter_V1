import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/data_source/auth/local_auth_data_source.dart';
import 'package:mukgen_flutter_v1/data/data_source/auth/remote/remote_auth_data_source.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/change_password_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/re_issue_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/sign_in_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/sign_up_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/auth/jwt_token_entity.dart';
import 'package:mukgen_flutter_v1/domain/repository/auth_repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthDataSource _remoteAuthDataSource;
  final LocalAuthDataSource _localAuthDataSource;

  AuthRepositoryImpl(
      {required RemoteAuthDataSource remoteAuthDataSource,
      required LocalAuthDataSource localAuthDataSource})
      : _remoteAuthDataSource = remoteAuthDataSource,
        _localAuthDataSource = localAuthDataSource;

  @override
  Future<Result<void, Exception>> changePassword(
          {required ChangePasswordRequestDTO changePasswordRequestDTO}) =>
      _remoteAuthDataSource.changePassword(
          changePasswordRequestDTO: changePasswordRequestDTO);

  @override
  Future<Result<bool, Exception>> idDuplicateCheck(
          {required String accountId}) =>
      _remoteAuthDataSource.idDuplicateCheck(accountId: accountId);

  @override
  Future<Result<JWTTokenEntity, Exception>> reIssue(
          {required ReIssueRequestDTO reIssueRequestDTO}) =>
      _remoteAuthDataSource.reIssue(reIssueRequestDTO: reIssueRequestDTO);

  @override
  Future<Result<JWTTokenEntity, Exception>> signIn(
          {required SignInRequestDTO signInRequestDTO}) =>
      _remoteAuthDataSource.signIn(signInRequestDTO: signInRequestDTO);

  @override
  Future<Result<void, Exception>> signUp(
          {required SignUpRequestDTO signUpRequestDTO}) =>
      _remoteAuthDataSource.signUp(signUpRequestDTO: signUpRequestDTO);

  @override
  Future<void> logOut() => _localAuthDataSource.logOut();

  @override
  Future<void> tokenSave({required JWTTokenEntity jwtTokenEntity}) =>
      _localAuthDataSource.tokenSave(jwtTokenEntity: jwtTokenEntity);
}
