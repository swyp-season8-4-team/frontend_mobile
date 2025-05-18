import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/model/user/blocked_user_list_model.dart';
import 'package:frontend_mobile/domain/model/user/blocked_user_model.dart';
import 'package:frontend_mobile/domain/model/user/nickname_availability_model.dart';
import 'package:frontend_mobile/domain/model/user/user_detail_model.dart';
import 'package:frontend_mobile/domain/model/user/user_review_model.dart';
import 'package:frontend_mobile/domain/param/user/block_user_params.dart';
import 'package:frontend_mobile/domain/param/user/patch_me_params.dart';
import 'package:frontend_mobile/domain/param/user/post_nickname_params.dart';
import 'package:frontend_mobile/domain/param/user/unblock_user_params.dart';
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

  /// 회원 탈퇴
  Future<Result<void, CustomException>> deleteMe({required NoParams params});

  /// 내가 작성한 한줄리뷰 조회
  Future<Result<UserReviewModel, CustomException>> getNyReviews({
    required NoParams params,
  });

  /// 차단한 사용자 목록 조회
  Future<Result<BlockedUserListModel, CustomException>> getBlockedUsers({
    required NoParams params,
  });

  /// 사용자 차단하기
  Future<Result<BlockedUserModel, CustomException>> postBlockUser({
    required BlockUserParams params,
  });

  /// 특정 사용자 차단 해제
  Future<Result<void, CustomException>> unblockUser({
    required UnblockUserParams params,
  });
}
