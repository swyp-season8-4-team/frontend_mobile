import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/input_box.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/find_password_wrapper.dart';
import 'package:frontend_mobile/core/util/loading_overlay.dart';
import 'package:frontend_mobile/domain/param/email/email_verification_request_params.dart';
import 'package:frontend_mobile/presentation/find_password/find_password_view_model.dart';
import 'package:frontend_mobile/presentation/find_password/view/find_password_step2.dart';

class FindPasswordStep1 extends ConsumerStatefulWidget {
  const FindPasswordStep1({super.key});

  @override
  ConsumerState<FindPasswordStep1> createState() => _FindPasswordStep1State();
}

class _FindPasswordStep1State extends ConsumerState<FindPasswordStep1> {
  final TextEditingController _emailController = TextEditingController();
  final bool _disabled = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_renderHandler);
  }

  void _renderHandler() {
    setState(() {});
  }

  bool _isValidEmail({required String email}) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  void dispose() {
    _emailController.removeListener(_renderHandler);
    _emailController.dispose();
    super.dispose();
  }

  void _onNextButton() async {
    final FindPasswordState state = await ref
        .read(findPasswordViewModelProvider.notifier)
        .postVerificationRequest(
          params: EmailVerificationRequestParams(
            email: _emailController.text,
            purpose: 'PASSWORD_RESET',
          ),
        );

    if (mounted) {
      switch (state.status) {
        case Status.success:
          await Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder:
                  (BuildContext ctx) =>
                      FindPasswordStep2(email: _emailController.text),
            ),
          );
          break;

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
                      '가입하셨던 이메일 주소를 알려주세요',
                      style: textTheme.titleLarge?.copyWith(
                        color: ScaleColorConfig.primary5,
                      ),
                    ),
                    const SizedBox(height: 45),
                    CustomInputBox(
                      controller: _emailController,
                      closeControll: true,
                      hintText: '이메일을 입력해 주세요',
                    ),
                  ],
                ),
              ),
            ),
            CustomFillButton.large(
              label: '다음',
              disabled:
                  state.status == Status.loading ||
                  !_isValidEmail(email: _emailController.text),
              onPressed: _onNextButton,
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 32),
          ],
        ),
      ),
    );
  }
}
