import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_setting.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/input_box.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/resource/nickname.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/core/util/text_line_break.dart';
import 'package:frontend_mobile/domain/param/auth/post_sign_up_with_profile_params.dart';
import 'package:frontend_mobile/domain/param/user/post_nickname_params.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/sign_up/sign_up_view_model.dart';
import 'package:frontend_mobile/presentation/sign_up/widget/sign_up_wrapper.dart';
import 'package:go_router/go_router.dart';

class SignUpStep5 extends ConsumerStatefulWidget {
  const SignUpStep5({required this.isSelectedBoy, super.key});

  final bool isSelectedBoy;

  @override
  ConsumerState<SignUpStep5> createState() => _SignUpStep5State();
}

class _SignUpStep5State extends ConsumerState<SignUpStep5> {
  final TextEditingController _nicknameController = TextEditingController();

  bool _error = false;
  final String _errorText = '사용 불가능한 닉네임입니다';
  bool _success = false;
  final String _successText = '사용 가능한 닉네임입니다';

  bool _isValidNickname = false;

  MultipartFile? profileImage;

  @override
  void initState() {
    super.initState();
    _nicknameController.addListener(_renderHandler);
  }

  void _renderHandler() {
    setState(() {
      _error = false;
      _success = false;
      _isValidNickname = false;
    });
  }

  void onCameraTap(Uint8List imageBytes) async {
    final MultipartFile multipartFile = MultipartFile.fromBytes(
      imageBytes,
      filename: 'profile_${DateTime.now().toIso8601String()}.png',
      contentType: DioMediaType('image', 'png'),
    );

    profileImage = multipartFile;
  }

  @override
  void dispose() {
    _nicknameController.removeListener(_renderHandler);
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SignUpState state = ref.watch(signUpViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    ref.listen(signUpViewModelProvider, (_, SignUpState next) {
      switch (next.postSignUpWithProfileStatus) {
        case Status.success:
          context.pushNamed(AppRoutes.signUpStep6.name);
          break;

        case Status.failure:
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog.basic(
                description: next.exception.message,
                primaryButton: CustomDialogButton(
                  text: '확인',
                  onTap: () => context.pop(),
                ),
              );
            },
          );
          break;

        default:
      }

      switch (next.postNicknameStatus) {
        case Status.success:
          if (next.nicknameAvailabilityData.available) {
            ref.read(signUpProvider.notifier).state = ref
                .read(signUpProvider)
                .copyWith(nickname: _nicknameController.text);

            setState(() {
              _error = false;
              _success = true;
              _isValidNickname = true;
            });
          } else {
            setState(() {
              _error = true;
              _success = false;
              _isValidNickname = false;
            });
          }

          break;

        case Status.failure:
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog.basic(
                description: next.exception.message,
                primaryButton: CustomDialogButton(
                  text: '확인',
                  onTap: () => context.pop(),
                ),
              );
            },
          );
          break;

        default:
      }
    });

    return CustomLoadingOverlay(
      isLoading:
          state.postNicknameStatus.isLoading ||
          state.postSignUpWithProfileStatus.isLoading,
      child: CustomSignUpWrapper(
        title: '기본 프로필',
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextLineBreak(
                      text: '프로필 사진과 닉네임을 입력해주세요',
                      style: textTheme.titleLarge?.copyWith(
                        color: ScaleColorConfig.primary5,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      '닉네임 2~20자, 나중에 언제든지 변경 가능합니다.',
                      style: textTheme.titleSmall?.copyWith(
                        color: ScaleColorConfig.neutral30,
                      ),
                    ),
                    const SizedBox(height: 30),

                    Align(
                      child:
                          widget.isSelectedBoy
                              ? CustomProfilePhotoSetting.boy(
                                onCameraTap: onCameraTap,
                              )
                              : CustomProfilePhotoSetting.girl(
                                onCameraTap: onCameraTap,
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
                            success: _success,
                            successText: _successText,
                            error: _error,
                            errorText: _errorText,
                            onCloseButtonTap: () {
                              _isValidNickname = false;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        CustomFillButton.medium(
                          label: '중복확인',
                          backgroundColor: CustomFillButtonColor.olive,
                          disabled: _nicknameController.text.isEmpty,
                          width: 110,
                          onPressed: () {
                            ref
                                .read(signUpViewModelProvider.notifier)
                                .postNickname(
                                  params: PostNicknameParams(
                                    nickname: _nicknameController.text,
                                    purpose: Nickname.signUp.value,
                                  ),
                                );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            CustomFillButton.large(
              label: '다음',
              disabled: !_isValidNickname,
              onPressed: () {
                final PostSignUpWithProfileParams state = ref.read(
                  signUpProvider,
                );

                ref
                    .read(signUpViewModelProvider.notifier)
                    .postSignUpWithProfile(
                      params: state.copyWith(profileImage: profileImage),
                    );
              },
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 32),
          ],
        ),
      ),
    );
  }
}
