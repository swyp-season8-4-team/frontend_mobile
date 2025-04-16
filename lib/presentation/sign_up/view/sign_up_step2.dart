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
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/param/email/email_verification_request_params.dart';
import 'package:frontend_mobile/domain/param/email/email_verify_params.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/sign_up/sign_up_view_model.dart';
import 'package:frontend_mobile/presentation/sign_up/widget/sign_up_wrapper.dart';
import 'package:go_router/go_router.dart';

class SignUpStep2 extends ConsumerStatefulWidget {
  const SignUpStep2({required this.email, super.key});

  final String email;

  @override
  ConsumerState<SignUpStep2> createState() => _SignUpStep2State();
}

class _SignUpStep2State extends ConsumerState<SignUpStep2> {
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

    final ToastManager toastManager = ref.read(toastManagerProvider);

    toastManager.show(
      context: context,
      aboveBottomNavigation: true,
      toastWidget: const CustomSnackBar(description: '인증코드를 다시 보내드렸습니다.'),
    );

    ref
        .read(signUpViewModelProvider.notifier)
        .postVerificationRequest(
          params: EmailVerificationRequestParams(
            email: widget.email,
            purpose: EmailPurpose.signUp.value,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final SignUpState state = ref.watch(signUpViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    ref.listen(signUpViewModelProvider, (_, SignUpState state) {
      switch (state.postVerifyStatus) {
        case Status.success:
          ref.read(signUpProvider.notifier).state = ref
              .read(signUpProvider)
              .copyWith(emailToken: state.verifyData.verificationToken);

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
      child: CustomSignUpWrapper(
        title: '인증코드',
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
                            hintText: '인증번호 N자리',
                            closeControll: true,
                            success: _success,
                            successText: _successText,
                            error: _error,
                            errorText: _errorText,
                            onCloseButtonTap: () {
                              _isValidCode = false;
                            },
                            keyboardType: TextInputType.number,
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
                                .read(signUpViewModelProvider.notifier)
                                .postVerify(
                                  params: EmailVerifyParams(
                                    email: widget.email,
                                    code: _codeController.text,
                                    purpose: EmailPurpose.signUp.value,
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
                context.pushNamed(AppRoutes.signUpStep3.name);
              },
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 32),
          ],
        ),
      ),
    );
  }
}
