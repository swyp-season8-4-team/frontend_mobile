import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/presentation/auth/auth_view_model.dart';
import 'package:frontend_mobile/presentation/global/login/login_view_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(userViewModelProvider.notifier).getMe();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userViewModelProvider, (_, UserState next) {
      switch (next.status) {
        case Status.success:

          /// 로그인 유무 판단
          ref.read(loginViewModelProvider.notifier).login();

          context.goNamed(AppRoutes.map.name);
          break;

        case Status.failure:
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog.basic(
                description: next.exception.message,
                primaryButton: CustomDialogButton(
                  text: '확인',
                  onTap: () => context.goNamed(AppRoutes.localLogin.name),
                ),
              );
            },
          );

          break;

        default:
      }
    });

    ref.listen(authViewModelProvider, (_, AuthState next) {
      switch (next.statusRefreshToken) {
        case Status.failure:
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog.basic(
                description: next.exception.message,
                primaryButton: CustomDialogButton(
                  text: '확인',
                  onTap: () => context.goNamed(AppRoutes.localLogin.name),
                ),
              );
            },
          );
        default:
      }
    });

    return Material(
      color: const Color(0xFF723E00),
      child: Assets.image.splash.image(),
    );
  }
}
