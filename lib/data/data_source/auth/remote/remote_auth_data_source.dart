import 'package:mukgen_flutter_v1/core/network/networking.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/data_source/auth/remote/auth_endpoint.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/change_password_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/re_issue_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/sign_in_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/sign_up_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/response/id_duplicate_check_response_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/response/re_issue_response_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/response/sign_in_response_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/auth/jwt_token_entity.dart';

class RemoteAuthDataSource {
  final Networking _networking;

  RemoteAuthDataSource({required Networking networking})
      : _networking = networking;

  Future<Result<JWTTokenEntity, Exception>> signIn(
      {required SignInRequestDTO signInRequestDTO}) async {
    final res = await _networking.request<SignInResponseDTO, SignInResponseDTO>(
        endpoint: AuthEndpoint.signIn(signInRequestDTO: signInRequestDTO),
        responseType: SignInResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }

  Future<Result<JWTTokenEntity, Exception>> reIssue(
      {required ReIssueRequestDTO reIssueRequestDTO}) async {
    final res =
        await _networking.request<ReIssueResponseDTO, ReIssueResponseDTO>(
            endpoint:
                AuthEndpoint.reIssue(reIssueRequestDTO: reIssueRequestDTO),
            responseType: ReIssueResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }

  Future<Result<void, Exception>> signUp(
          {required SignUpRequestDTO signUpRequestDTO}) async =>
      await _networking.noResponseRequest(
          endpoint: AuthEndpoint.signUp(signUpRequestDTO: signUpRequestDTO));

  Future<Result<void, Exception>> changePassword(
          {required ChangePasswordRequestDTO changePasswordRequestDTO}) async =>
      await _networking.noResponseRequest(
          endpoint: AuthEndpoint.changePassword(
        changePasswordRequestDTO: changePasswordRequestDTO,
      ));

  Future<Result<bool, Exception>> idDuplicateCheck(
      {required String accountId}) async {
    final res = await _networking
        .request<IdDuplicateCheckResponseDTO, IdDuplicateCheckResponseDTO>(
      endpoint: AuthEndpoint.idDuplicateCheck(accountId: accountId),
      responseType: IdDuplicateCheckResponseDTO(),
    );
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }
}
