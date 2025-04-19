import 'package:frontend_mobile/data/entity/user/nickname_availability_entity.dart';
import 'package:frontend_mobile/data/entity/user/user_detail_entity.dart';
import 'package:frontend_mobile/data/request_body/user/patch_me_request_body.dart';
import 'package:frontend_mobile/data/request_body/user/post_nickname_request_body.dart';
import 'package:frontend_mobile/domain/model/user/nickname_availability_model.dart';
import 'package:frontend_mobile/domain/model/user/user_detail_model.dart';
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
