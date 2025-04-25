import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/core/util/image_util.dart';
import 'package:frontend_mobile/domain/model/user/nickname_availability_model.dart';
import 'package:frontend_mobile/domain/model/user/user_detail_model.dart';
import 'package:frontend_mobile/domain/param/user/patch_me_params.dart';
import 'package:frontend_mobile/domain/param/user/post_nickname_params.dart';
import 'package:frontend_mobile/domain/param/user/update_profile_image_params.dart';
import 'package:frontend_mobile/domain/usecase/user/patch_me_usecase.dart';
import 'package:frontend_mobile/domain/usecase/user/post_nickname_usecase.dart';
import 'package:frontend_mobile/domain/usecase/user/update_profile_image_usecase.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'dart:typed_data';

part 'update_profile_info_state.dart';
part 'generated/update_profile_info_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<
  UpdateProfileInfoViewModel,
  UpdateProfileInfoState
>
updateProfileInfoViewModelProvider = StateNotifierProvider.autoDispose<
  UpdateProfileInfoViewModel,
  UpdateProfileInfoState
>((Ref ref) {
  final UserState userState = ref.read(userViewModelProvider);
  return UpdateProfileInfoViewModel(
    ref: ref,
    initState: UpdateProfileInfoState(
      oldImageUrl: userState.data.profileImageUrl,
      nickName: userState.data.nickname,
      userPreferences: userState.data.preferences,
    ),
  );
});

class UpdateProfileInfoViewModel extends StateNotifier<UpdateProfileInfoState> {
  UpdateProfileInfoViewModel({
    required Ref<Object?> ref,
    required UpdateProfileInfoState initState,
  }) : _ref = ref,
       super(initState);

  final Ref _ref;

  /// 닉네임 수정 (API 호출 X)
  void updateNickName({required String nickname}) {
    clearNicknameStatus();
    state = state.copyWith(nickName: nickname);
  }

  /// 닉네임 상태 초기화
  void clearNicknameStatus() {
    state = state.copyWith(
      postNicknameStatus: Status.initial,
      nicknameAvailabilityData: const NicknameAvailabilityModel(
        available: false,
      ),
    );
  }

  /// 프로필 이미지 수정 (API 호출 X)
  Future<void> updateProfileImage({required Uint8List imageUint8List}) async {
    try {
      final File? imageFile = await ImageUtil.uint8ListToFile(
        imageUint8List: imageUint8List,
      );

      state = state.copyWith(newImageFile: imageFile);
    } catch (e) {
      return;
    }
  }

  /// 유저 취향 태그 정보 수정 (API 호출 X)
  void updateUserPreferences({required int preferenceTagId}) async {
    final bool hasPreference =
        state.userPreferences.firstWhereOrNull(
          (int e) => e == preferenceTagId,
        ) !=
        null;

    if (hasPreference) {
      state = state.copyWith(
        userPreferences:
            state.userPreferences
                .where((int e) => e != preferenceTagId)
                .toList(),
      );
    } else {
      state = state.copyWith(
        userPreferences: <int>[...state.userPreferences, preferenceTagId],
      );
    }
  }

  /// 닉네임 중복 검사
  Future<void> postNickname() async {
    state = state.copyWith(postNicknameStatus: Status.loading);

    final Result<NicknameAvailabilityModel, CustomException> response =
        await Usecase.execute(
          usecase: _ref.read(postNicknameUsecaseProvider),
          params: PostNicknameParams(
            nickname: state.nickName,

            // TODO: enum을 통해 관리할 필요가 있음
            purpose: 'PROFILE_UPDATE',
          ),
        );

    response.map(
      success: (Success<NicknameAvailabilityModel, CustomException> success) {
        state = state.copyWith(
          postNicknameStatus: Status.success,
          nicknameAvailabilityData: success.data,
        );
      },
      failure: (Failure<NicknameAvailabilityModel, CustomException> failure) {
        state = state.copyWith(
          postNicknameStatus: Status.failure,
          postNicknameException: failure.exception.model,
        );
      },
    );
  }

  /// 프로필 이미지 수정
  Future<void> postProfileImage() async {
    // 새로운 프로필 이미지를 등록하지 않았다면
    // 프로필 이미지 수정 상태를 자동으로 성공처리
    if (state.newImageFile == null) {
      state = state.copyWith(updateProfileImageStatus: Status.success);
      return;
    }

    state = state.copyWith(updateProfileImageStatus: Status.loading);

    final Result<void, CustomException> result = await Usecase.execute(
      usecase: _ref.read(updateProfileImageUsecaseProvider),
      params: UpdateProfileImageParams(image: state.newImageFile!),
    );

    result.map(
      success: (Success<void, CustomException> success) {
        state = state.copyWith(updateProfileImageStatus: Status.success);
      },
      failure: (Failure<void, CustomException> failure) {
        state = state.copyWith(
          updateProfileImageStatus: Status.failure,
          updateProfileImageException: failure.exception.model,
        );
      },
    );
  }

  /// 유저 프로필 정보 수정
  Future<void> updateProfileInfo() async {
    await postProfileImage();

    // 프로필 이미지 수정하는 것에 실패했다면
    // 프로필 정보를 수정하는 상태도 강제적으로 실패처리
    if (state.updateProfileImageStatus.isFailure) {
      state = state.copyWith(updateUserInfoStatus: Status.failure);
      return;
    }

    state = state.copyWith(updateUserInfoStatus: Status.loading);

    final Result<UserDetailModel, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(patchMeUsecaseProvider),
          params: PatchMeParams(
            nickname: state.nickName,
            preferences: state.userPreferences,
          ),
        );

    result.map(
      success: (Success<UserDetailModel, CustomException> success) {
        state = state.copyWith(updateUserInfoStatus: Status.success);
      },
      failure: (Failure<UserDetailModel, CustomException> failure) {
        state = state.copyWith(
          updateUserInfoStatus: Status.failure,
          updateUserInfoException: failure.exception.model,
        );
      },
    );
  }
}
