import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/chip/suggestive_chip.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_setting.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/input_box.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/presentation/global/preference/preference_view_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:frontend_mobile/presentation/my_page/update_profile/update_profile_info_view_model.dart';
import 'package:go_router/go_router.dart';

class UpdateProfileInfoView extends ConsumerStatefulWidget {
  const UpdateProfileInfoView({super.key});

  @override
  ConsumerState<UpdateProfileInfoView> createState() =>
      _UpdateProfileInfoViewState();
}

class _UpdateProfileInfoViewState extends ConsumerState<UpdateProfileInfoView> {
  final TextEditingController _nicknameController = TextEditingController();
  final String _successText = '사용 가능한 닉네임입니다';
  final String _errorText = '사용 불가능한 닉네임입니다';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final UserState userState = ref.read(userViewModelProvider);
      _nicknameController.text = userState.data.nickname;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserState userState = ref.watch(userViewModelProvider);
    final UpdateProfileInfoState state = ref.watch(
      updateProfileInfoViewModelProvider,
    );
    final PreferenceState preferences = ref.watch(preferenceViewModelProvider);
    final UpdateProfileInfoViewModel viewmodel = ref.read(
      updateProfileInfoViewModelProvider.notifier,
    );

    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    ref.listen(
      updateProfileInfoViewModelProvider.select(
        (UpdateProfileInfoState state) => state.updateUserInfoStatus,
      ),
      (_, Status next) {
        if (next.isSuccess) {
          ref.read(userViewModelProvider.notifier).getMe();
          context.pop(true);
        }
      },
    );

    return CustomLoadingOverlay(
      isLoading:
          state.updateUserInfoStatus.isLoading ||
          state.updateProfileImageStatus.isLoading ||
          state.postNicknameStatus.isLoading,
      child: Scaffold(
        appBar: const CustomSubTopBar(
          title: '프로필 관리',
          actions: <Widget>[],
          primary: false,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 25,
                        right: 16,
                        bottom: 50,
                      ),
                      child: Column(
                        children: <Widget>[
                          Align(
                            child:
                                userState.isMale
                                    ? CustomProfilePhotoSetting.boy(
                                      onCameraTap: (Uint8List image) {
                                        viewmodel.updateProfileImage(
                                          imageUint8List: image,
                                        );
                                      },
                                      imageUrl: state.oldImageUrl,
                                    )
                                    : CustomProfilePhotoSetting.girl(
                                      onCameraTap: (Uint8List image) {
                                        viewmodel.updateProfileImage(
                                          imageUint8List: image,
                                        );
                                      },
                                      imageUrl: state.oldImageUrl,
                                    ),
                          ),
                          const SizedBox(height: 26),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: CustomInputBox(
                                  controller: _nicknameController,
                                  hintText: '닉네임',
                                  closeControll: true,
                                  success:
                                      state.nicknameAvailabilityData.available,
                                  successText: _successText,
                                  error:
                                      state.postNicknameStatus.isFailure ||
                                      (state.postNicknameStatus.isSuccess &&
                                          !state
                                              .nicknameAvailabilityData
                                              .available),
                                  errorText: _errorText,
                                  onCloseButtonTap: () {
                                    viewmodel.updateNickName(nickname: '');
                                  },
                                  onChanged: (String val) {
                                    viewmodel.updateNickName(nickname: val);
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              CustomFillButton.medium(
                                label: '중복확인',
                                backgroundColor: CustomFillButtonColor.olive,
                                disabled: state.nickName.isEmpty,
                                width: 110,
                                onPressed: () {
                                  viewmodel.postNickname();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 1, color: colorScheme.outline),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 15,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              '내 디저트 취향',
                              style: textTheme.titleSmall?.copyWith(
                                color: ScaleColorConfig.primary20,
                              ),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: <InlineSpan>[
                                TextSpan(
                                  text: state.userPreferences.length.toString(),
                                  style: textTheme.labelLarge?.copyWith(
                                    color: ScaleColorConfig.success50,
                                  ),
                                ),
                                TextSpan(
                                  text: '개 선택',
                                  style: textTheme.labelLarge?.copyWith(
                                    color: ScaleColorConfig.neutral30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 1, color: colorScheme.outline),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _PreferenceFilters(
                            title: '식단&건강',
                            preferences: preferences.data.sublist(0, 5),
                          ),
                          const SizedBox(height: 24),
                          _PreferenceFilters(
                            title: '트렌드&감성',
                            preferences: preferences.data.sublist(5, 8),
                          ),
                          const SizedBox(height: 24),
                          _PreferenceFilters(
                            title: '경험&독창성',
                            preferences: preferences.data.sublist(8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: colorScheme.outline)),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: CustomFillButton.medium(
                  label: '저장',
                  disabled:
                      !state.postNicknameStatus.isSuccess ||
                      !state.nicknameAvailabilityData.available,
                  onPressed: () {
                    viewmodel.updateProfileInfo();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }
}

// 유저 취향 필터 리스트
class _PreferenceFilters extends ConsumerWidget {
  const _PreferenceFilters({required this.preferences, required this.title});
  final String title;
  final List<PreferenceModel> preferences;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final UpdateProfileInfoState state = ref.watch(
      updateProfileInfoViewModelProvider,
    );
    final UpdateProfileInfoViewModel viewmodel = ref.read(
      updateProfileInfoViewModelProvider.notifier,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: textTheme.labelLarge?.copyWith(
            color: ScaleColorConfig.neutral40,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          runSpacing: 6,
          spacing: 6,
          children: <Widget>[
            ...preferences.map(
              (PreferenceModel e) => CustomSuggestiveChip(
                label: e.preferenceName,
                onPressed: () {
                  viewmodel.updateUserPreferences(preferenceTagId: e.id);
                },
                isSelected: state.userPreferences.contains(e.id),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
