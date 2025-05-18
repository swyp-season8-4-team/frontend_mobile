import 'package:frontend_mobile/data/entity/user/blocked_user_entity.dart';
import 'package:frontend_mobile/data/entity/user/blocked_user_list_entity.dart';
import 'package:frontend_mobile/data/entity/user/nickname_availability_entity.dart';
import 'package:frontend_mobile/data/entity/user/user_detail_entity.dart';
import 'package:frontend_mobile/data/entity/user/user_review_entity.dart';
import 'package:frontend_mobile/data/request_body/user/block_user_request_body.dart';
import 'package:frontend_mobile/data/request_body/user/patch_me_request_body.dart';
import 'package:frontend_mobile/data/request_body/user/post_nickname_request_body.dart';
import 'package:frontend_mobile/domain/model/user/blocked_user_list_model.dart';
import 'package:frontend_mobile/domain/model/user/blocked_user_model.dart';
import 'package:frontend_mobile/domain/model/user/nickname_availability_model.dart';
import 'package:frontend_mobile/domain/model/user/user_detail_model.dart';
import 'package:frontend_mobile/domain/model/user/user_review_model.dart';
import 'package:frontend_mobile/domain/param/user/block_user_params.dart';
import 'package:frontend_mobile/domain/param/user/patch_me_params.dart';
import 'package:frontend_mobile/domain/param/user/post_nickname_params.dart';

extension UserDetailEntityExt on UserDetailEntity {
  UserDetailModel toModel() {
    return UserDetailModel(
      userUuid: userUuid,
      nickname: nickname,
      gender: gender,
      profileImageUrl: profileImageUrl,
      preferences: preferences,
      mbti: mbti,
      email: email,
      name: name,
      phoneNumber: phoneNumber,
      address: address,
      isPreferencesSet: isPreferencesSet,
    );
  }
}

extension PatchMeParamsExt on PatchMeParams {
  PatchMeRequestBody toBody() {
    return PatchMeRequestBody(
      nickname: nickname,
      preferences: preferences,
      name: name,
      phoneNumber: phoneNumber,
      address: address,
      gender: gender,
      mbti: mbti,
    );
  }
}

extension NicknameAvailabilityEntityExt on NicknameAvailabilityEntity {
  NicknameAvailabilityModel toModel() {
    return NicknameAvailabilityModel(available: available);
  }
}

extension PostNicknameParamsExt on PostNicknameParams {
  PostNicknameRequestBody toBody() {
    return PostNicknameRequestBody(nickname: nickname, purpose: purpose);
  }
}

extension UserReviewEntityExt on UserReviewEntity {
  UserReviewModel toModel() => UserReviewModel(
    reviewCount: reviewCount,
    reviews: reviews.map((UserReviewDetailEntity e) => e.toModel()).toList(),
  );
}

extension UserReviewDetailEntityExt on UserReviewDetailEntity {
  UserReviewDetailModel toModel() => UserReviewDetailModel(
    reviewUuid: reviewUuid,
    rating: rating,
    content: content,
    createdAt: createdAt,
    store: UserReviewStoreModel(
      storeUuid: store.storeUuid,
      name: store.name,
      address: store.address,
      thumbnail: store.thumbnail,
    ),
    reviewImage: reviewImage,
  );
}

extension BlockedUserEntityExt on BlockedUserEntity {
  BlockedUserModel toModel() => BlockedUserModel(
    id: id,
    blockerUserUuid: blockerUserUuid,
    blockedUserUuid: blockedUserUuid,
    blockedUserNickname: blockedUserNickname,
    createdAt: createdAt,
    blocked: blocked,
  );
}

extension BlockedUserListEntityExt on BlockedUserListEntity {
  BlockedUserListModel toModel() => BlockedUserListModel(
    blockedUsers:
        blockedUsers.map((BlockedUserEntity e) => e.toModel()).toList(),
    totalCount: totalCount,
  );
}

extension BlockUserParamsExt on BlockUserParams {
  BlockUserRequestBody toBody() {
    return BlockUserRequestBody(blockedUserUuid: blockedUserUuid);
  }
}
