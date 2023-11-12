import 'package:mukgen_flutter_v1/core/network/networking.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/data_source/user/remote/user_endpoint.dart';
import 'package:mukgen_flutter_v1/data/dto/user/request/upload_user_profile_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/user/response/read_user_profile_response_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/user/response/upload_user_profile_image_response_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/user/user_profile_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/user/user_profile_url_entity.dart';

class RemoteUserDataSource {
  final Networking _networking;

  RemoteUserDataSource({required Networking networking})
      : _networking = networking;

  Future<Result<UserProfileEntity, Exception>> readUserProfile() async {
    final res = await _networking
        .request<ReadUserProfileResponseDTO, ReadUserProfileResponseDTO>(
            endpoint: UserEndpoint.readUserProfile(),
            responseType: ReadUserProfileResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }

  Future<Result<UserProfileUrlEntity, Exception>> uploadUserProfileImage(
      UploadUserProfileRequestDTO uploadUserProfileRequestDTO) async {
    final res = await _networking.request<UploadUserProfileImageResponseDTO,
            UploadUserProfileImageResponseDTO>(
        endpoint: UserEndpoint.uploadUserProfileImage(
            uploadUserProfileRequestDTO: uploadUserProfileRequestDTO),
        responseType: UploadUserProfileImageResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }
}
