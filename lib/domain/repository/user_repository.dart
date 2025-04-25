import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/model/user/nickname_availability_model.dart';
import 'package:frontend_mobile/domain/model/user/user_detail_model.dart';
import 'package:frontend_mobile/domain/param/user/patch_me_params.dart';
import 'package:frontend_mobile/domain/param/user/post_nickname_params.dart';
import 'package:frontend_mobile/domain/param/user/update_profile_image_params.dart';

abstract interface class UserRepository {
  /// 닉네임 중복 검사
  Future<Result<NicknameAvailabilityModel, CustomException>> postNickname({
    required PostNicknameParams params,
  });

  /// 현재 사용자 정보 조회
  Future<Result<UserDetailModel, CustomException>> getMe();

  /// 사용자 정보 수정
  Future<Result<UserDetailModel, CustomException>> patchMe({
    required PatchMeParams params,
  });

  /// 프로필 이미지 수정
  Future<Result<void, CustomException>> updateProfileImage({
    required UpdateProfileImageParams params,
  });
}
