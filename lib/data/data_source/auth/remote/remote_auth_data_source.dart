import 'package:mukgen_flutter_v1/core/network/networking.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/data_source/auth/remote/auth_endpoint.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/sign_in_request_dto.dart';

class RemoteAuthDataSource {
  final Networking _networking;

  RemoteAuthDataSource({required Networking networking})
      : _networking = networking;

  Future<Result<void, Exception>> signIn(
          SignInRequestDTO signInRequestDTO) async =>
      await _networking.noResponseRequest(
          endpoint: AuthEndpoint.signIn(signInRequestDTO: signInRequestDTO));
}
