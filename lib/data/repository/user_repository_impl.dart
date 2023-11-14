import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/data_source/user/remote/remote_user_data_source.dart';
import 'package:mukgen_flutter_v1/data/dto/user/request/upload_user_profile_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/user/user_profile_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/user/user_profile_url_entity.dart';
import 'package:mukgen_flutter_v1/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final RemoteUserDataSource _remoteUserDataSource;

  UserRepositoryImpl({required RemoteUserDataSource remoteUserDataSource})
      : _remoteUserDataSource = remoteUserDataSource;

  @override
  Future<Result<UserProfileEntity, Exception>> readUserProfile() =>
      _remoteUserDataSource.readUserProfile();

  @override
  Future<Result<UserProfileUrlEntity, Exception>> uploadUserProfileImage(
          {required UploadUserProfileRequestDTO uploadUserProfileRequestDTO}) =>
      _remoteUserDataSource.uploadUserProfileImage(uploadUserProfileRequestDTO);
}
