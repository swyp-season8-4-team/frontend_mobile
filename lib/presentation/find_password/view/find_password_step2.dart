import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/text_button.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/input_box.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/manager/toast/toast_manager.dart';
import 'package:frontend_mobile/core/resource/email.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/find_password_wrapper.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/param/email/email_verification_request_params.dart';
import 'package:frontend_mobile/domain/param/email/email_verify_params.dart';
import 'package:frontend_mobile/presentation/find_password/find_password_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

class FindPasswordStep2 extends ConsumerStatefulWidget {
  const FindPasswordStep2({required this.email, super.key});

  final String email;

  @override
  ConsumerState<FindPasswordStep2> createState() => _FindPasswordStep2State();
}

class _FindPasswordStep2State extends ConsumerState<FindPasswordStep2> {
  final TextEditingController _codeController = TextEditingController();

  bool _error = false;
  String _errorText = '';
  bool _success = false;
  String _successText = '';

  bool _isValidCode = false;

  @override
  void initState() {
    super.initState();
    _codeController.addListener(_renderHandler);
  }

  void _renderHandler() {
    setState(() {
      _error = false;
      _success = false;
      _isValidCode = false;
    });
  }

  @override
  void dispose() {
    _codeController.removeListener(_renderHandler);
    _codeController.dispose();
    super.dispose();
  }

  void _onSendAgain() async {
    setState(() {
      _isValidCode = false;
      _success = false;
      _error = false;
    });

    Future<void>.delayed(const Duration(milliseconds: 100), () {
      final ToastManager toastManager = ref.read(toastManagerProvider);

      if (mounted) {
        toastManager.show(
          context: context,
          aboveBottomNavigation: true,
          toastWidget: const CustomSnackBar(description: '인증코드를 다시 보내드렸습니다.'),
        );
      }
    });

    ref
        .read(findPasswordViewModelProvider.notifier)
        .postVerificationRequest(
          params: EmailVerificationRequestParams(
            email: widget.email,
            purpose: EmailPurpose.passwordReset.value,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final FindPasswordState state = ref.watch(findPasswordViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    ref.listen(findPasswordViewModelProvider, (_, FindPasswordState next) {
      switch (next.postVerifyStatus) {
        case Status.success:
          ref.read(findPasswordProvider.notifier).state = ref
              .read(findPasswordProvider)
              .copyWith(emailToken: next.verifyData.verificationToken);

          setState(() {
            _isValidCode = true;
            _success = true;
            _successText = '인증이 완료되었습니다.';
          });
          break;

        case Status.failure:
          setState(() {
            _isValidCode = false;
            _error = true;
            _errorText = '잘못된 인증코드입니다.';
          });
          break;

        default:
      }
    });

    return CustomLoadingOverlay(
      isLoading: state.postVerifyStatus.isLoading,
      child: CustomFindPasswordWrapper(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.email,
                      style: textTheme.titleLarge?.copyWith(
                        color: ScaleColorConfig.primary60,
                      ),
                    ),
                    Text(
                      '인증코드를 보내드렸어요!',
                      style: textTheme.titleLarge?.copyWith(
                        color: ScaleColorConfig.primary5,
                      ),
                    ),
                    const SizedBox(height: 45),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: CustomInputBox(
                            controller: _codeController,
                            hintText: '인증번호 6자리',
                            maxLength: 6,
                            closeControll: true,
                            success: _success,
                            successText: _successText,
                            error: _error,
                            errorText: _errorText,
                            onCloseButtonTap: () {
                              _isValidCode = false;
                            },
                            keyboardType: TextInputType.number,
                            useTimer: true,
                            startSeconds: 5 * 60,
                          ),
                        ),
                        const SizedBox(width: 10),
                        CustomFillButton.medium(
                          label: '인증확인',
                          backgroundColor: CustomFillButtonColor.olive,
                          disabled:
                              state.postVerificationRequestStatus.isLoading ||
                              state.postVerifyStatus.isLoading ||
                              _codeController.text.length < 6,
                          width: 110,
                          onPressed: () {
                            ref
                                .read(findPasswordViewModelProvider.notifier)
                                .postVerify(
                                  params: EmailVerifyParams(
                                    email: widget.email,
                                    code: _codeController.text,
                                    purpose: EmailPurpose.passwordReset.value,
                                  ),
                                );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 45),

                    Row(
                      children: <Widget>[
                        Text(
                          '인증코드를 아직 받지 못하셨나요?',
                          style: textTheme.bodyLarge?.copyWith(
                            color: ScaleColorConfig.neutral30,
                          ),
                        ),
                        CustomTextButton.underline(
                          label: '재전송',
                          disabled: state.postVerifyStatus.isLoading,
                          onPressed: _onSendAgain,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CustomFillButton.large(
              label: '다음',
              disabled: !_isValidCode,
              onPressed: () {
                context.pushNamed(AppRoutes.findPasswordStep3.name);
              },
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 32),
          ],
        ),
      ),
    );
  }
}
