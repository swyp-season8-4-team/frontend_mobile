part of '../update_profile_info_view.dart';

class _ProfileImageAndNickname extends ConsumerStatefulWidget {
  const _ProfileImageAndNickname();

  @override
  ConsumerState<_ProfileImageAndNickname> createState() =>
      _ProfileImageAndNicknameState();
}

class _ProfileImageAndNicknameState
    extends ConsumerState<_ProfileImageAndNickname> {
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
    final UpdateProfileInfoViewModel viewmodel = ref.read(
      updateProfileInfoViewModelProvider.notifier,
    );

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 25, right: 16, bottom: 50),
      child: Column(
        children: <Widget>[
          Align(
            child:
                userState.isMale
                    ? CustomProfilePhotoSetting.boy(
                      onCameraTap: (Uint8List image) {
                        viewmodel.updateProfileImage(imageUint8List: image);
                      },
                      imageUrl: state.oldImageUrl,
                    )
                    : CustomProfilePhotoSetting.girl(
                      onCameraTap: (Uint8List image) {
                        viewmodel.updateProfileImage(imageUint8List: image);
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
                  success: state.nicknameAvailabilityData.available,
                  successText: _successText,
                  error:
                      state.postNicknameStatus.isFailure ||
                      (state.postNicknameStatus.isSuccess &&
                          !state.nicknameAvailabilityData.available),
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
    );
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }
}
