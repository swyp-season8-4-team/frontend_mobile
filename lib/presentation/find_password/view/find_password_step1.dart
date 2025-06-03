import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/input_box.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/resource/email.dart';
import 'package:frontend_mobile/core/resource/extension.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/find_password_wrapper.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/param/email/email_verification_request_params.dart';
import 'package:frontend_mobile/presentation/find_password/find_password_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

class FindPasswordStep1 extends ConsumerStatefulWidget {
  const FindPasswordStep1({super.key});

  @override
  ConsumerState<FindPasswordStep1> createState() => _FindPasswordStep1State();
}

class _FindPasswordStep1State extends ConsumerState<FindPasswordStep1> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_renderHandler);
  }

  void _renderHandler() {
    setState(() {});
  }

  @override
  void dispose() {
    _emailController.removeListener(_renderHandler);
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FindPasswordState state = ref.watch(findPasswordViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    ref.listen(findPasswordViewModelProvider, (_, FindPasswordState next) {
      switch (next.postVerificationRequestStatus) {
        case Status.success:
          final GoRouterState route = GoRouter.of(context).routerDelegate.state;
          if (route.name == AppRoutes.findPasswordStep1.name) {
            ref.read(findPasswordProvider.notifier).state = ref
                .read(findPasswordProvider)
                .copyWith(email: _emailController.text);

            context.pushNamed(
              AppRoutes.findPasswordStep2.name,
              extra: _emailController.text,
            );
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
                  onTap:
                      next.exception.code == 'ZZ003'
                          ? () => context.goNamed(AppRoutes.localLogin.name)
                          : () => context.pop(),
                ),
              );
            },
          );
          break;

        default:
      }
    });

    return CustomLoadingOverlay(
      isLoading: state.postVerificationRequestStatus.isLoading,
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
                  state.postVerificationRequestStatus.isLoading ||
                  !_emailController.text.isEmail,
              onPressed: () {
                ref
                    .read(findPasswordViewModelProvider.notifier)
                    .postVerificationRequest(
                      params: EmailVerificationRequestParams(
                        email: _emailController.text,
                        purpose: EmailPurpose.passwordReset.value,
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
