import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/dto/user/request/upload_user_profile_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/user/user_profile_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/user/user_profile_url_entity.dart';

abstract class UserRepository {
  Future<Result<UserProfileEntity, Exception>> readUserProfile();

  Future<Result<UserProfileUrlEntity, Exception>> uploadUserProfileImage(
      {required UploadUserProfileRequestDTO uploadUserProfileRequestDTO});
}
