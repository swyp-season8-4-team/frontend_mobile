import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/input_box.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/resource/email.dart';
import 'package:frontend_mobile/core/resource/extension.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/core/util/text_line_break.dart';
import 'package:frontend_mobile/domain/param/email/email_verification_request_params.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/sign_up/sign_up_view_model.dart';
import 'package:frontend_mobile/presentation/sign_up/widget/sign_up_wrapper.dart';
import 'package:go_router/go_router.dart';

class SignUpStep1 extends ConsumerStatefulWidget {
  const SignUpStep1({super.key});

  @override
  ConsumerState<SignUpStep1> createState() => _SignUpStep1State();
}

class _SignUpStep1State extends ConsumerState<SignUpStep1> {
  final TextEditingController _emailController = TextEditingController();

  bool _error = false;
  String _errorText = '';
  bool _success = false;
  String _successText = '';

  bool _isValidEmail = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_renderHandler);
  }

  void _renderHandler() {
    setState(() {
      _isValidEmail = false;
      _success = false;
      _error = false;
    });
  }

  @override
  void dispose() {
    _emailController.removeListener(_renderHandler);
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SignUpState state = ref.watch(signUpViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    ref.listen(signUpViewModelProvider, (_, SignUpState next) {
      switch (next.postVerificationRequestStatus) {
        case Status.success:
          ref.read(signUpProvider.notifier).state = ref
              .read(signUpProvider)
              .copyWith(email: _emailController.text);

          setState(() {
            _isValidEmail = true;
            _success = true;
            _successText = next.verificationRequestData.message;
          });

        case Status.failure:
          switch (next.exception.code) {
            case 'A001':
              setState(() {
                _error = true;
                _errorText = next.exception.message;
              });
              break;

            default:
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
          }

        default:
      }
    });

    return CustomLoadingOverlay(
      isLoading: state.postVerificationRequestStatus.isLoading,
      child: CustomSignUpWrapper(
        title: '이메일',
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextLineBreak(
                      text: '회원가입을 위해 이메일 주소를 입력해주세요',
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
                            controller: _emailController,
                            closeControll: true,
                            hintText: '이메일',
                            success: _success,
                            successText: _successText,
                            error: _error,
                            errorText: _errorText,
                          ),
                        ),
                        const SizedBox(width: 10),
                        CustomFillButton.medium(
                          label: '중복확인',
                          backgroundColor: CustomFillButtonColor.olive,
                          disabled: !_emailController.text.isEmail,
                          width: 100,
                          onPressed: () {
                            ref
                                .read(signUpViewModelProvider.notifier)
                                .postVerificationRequest(
                                  params: EmailVerificationRequestParams(
                                    email: _emailController.text,
                                    purpose: EmailPurpose.signUp.value,
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
              disabled: !_isValidEmail,
              onPressed: () {
                context.pushNamed(
                  AppRoutes.signUpStep2.name,
                  extra: _emailController.text,
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
