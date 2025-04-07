import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/text_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/input_box.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/manager/toast/toast_manager.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/find_password_wrapper.dart';
import 'package:frontend_mobile/core/util/loading_overlay.dart';
import 'package:frontend_mobile/domain/param/email/email_verification_request_params.dart';
import 'package:frontend_mobile/domain/param/email/email_verify_params.dart';
import 'package:frontend_mobile/presentation/find_password/find_password_view_model.dart';
import 'package:frontend_mobile/presentation/find_password/view/find_password_step3.dart';

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

  bool _validationCheck = false;

  @override
  void initState() {
    super.initState();
    _codeController.addListener(_renderHandler);
  }

  void _renderHandler() {
    setState(() {
      _error = false;
      _success = false;
    });
  }

  @override
  void dispose() {
    _codeController.removeListener(_renderHandler);
    _codeController.dispose();
    super.dispose();
  }

  void _onValidationCheck() async {
    final FindPasswordState state = await ref
        .read(findPasswordViewModelProvider.notifier)
        .postVerify(
          params: EmailVerifyParams(
            email: widget.email,
            code: _codeController.text,
            purpose: 'PASSWORD_RESET',
          ),
        );

    switch (state.status) {
      case Status.success:
        setState(() {
          _validationCheck = true;
          _success = true;
          _successText = '인증이 완료되었습니다.';
        });
        break;

      case Status.failure:
        setState(() {
          _validationCheck = true;
          _error = true;
          _errorText = state.exception.message;
        });
        break;

      default:
    }
  }

  void _onSendAgain() async {
    setState(() {
      _validationCheck = false;
      _success = false;
      _error = false;
    });

    final ToastManager toastManager = ref.read(toastManagerProvider);

    toastManager.show(
      context: context,
      aboveBottomNavigation: true,
      toastWidget: const CustomSnackBar(description: '인증코드를 다시 보내드렸습니다.'),
    );

    final FindPasswordState state = await ref
        .read(findPasswordViewModelProvider.notifier)
        .postVerificationRequest(
          params: EmailVerificationRequestParams(
            email: widget.email,
            purpose: 'PASSWORD_RESET',
          ),
        );

    if (mounted) {
      switch (state.status) {
        case Status.failure:
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog.basic(description: state.exception.message);
            },
          );
          break;

        default:
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final FindPasswordState state = ref.watch(findPasswordViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return CustomLoadingOverlay(
      isLoading: state.status == Status.loading,
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
                            hintText: '인증번호 N자리',
                            closeControll: true,
                            success: _success,
                            successText: _successText,
                            error: _error,
                            errorText: _errorText,
                          ),
                        ),
                        const SizedBox(width: 10),
                        CustomFillButton.medium(
                          label: '중복확인',
                          disabled:
                              state.status == Status.loading ||
                              _codeController.text.length < 6,
                          width: 100,
                          onPressed: _onValidationCheck,
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
                          disabled: state.status == Status.loading,
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
              disabled: state.status == Status.loading || !_validationCheck,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext ctx) => const FindPasswordStep3(),
                  ),
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
