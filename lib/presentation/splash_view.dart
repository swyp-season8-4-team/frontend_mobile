import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/core/resource/token_info.dart';
import 'package:frontend_mobile/domain/param/auth/local_login_params.dart';
import 'package:frontend_mobile/presentation/local_login/local_login_view_model.dart';
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
    _autoLogin();
  }

  Future<void> _autoLogin() async {
    /// TODO: 제대로된 splash 만들면 지우기
    await Future<void>.delayed(const Duration(seconds: 1));

    const FlutterSecureStorage storage = FlutterSecureStorage();
    final String? json = await storage.read(key: Constant.tokenInfo);

    if (!mounted) return;
    if (json != null) {
      final TokenInfo tokenInfo = TokenInfo.deserialize(json: json);

      final DateTime now = DateTime.now();
      final DateTime startTime = tokenInfo.startTime;
      final int expiresIn = tokenInfo.expiresIn;
      final String email = tokenInfo.email;
      final String password = tokenInfo.password;

      /// 토큰값이 유효한 경우 -> 자동 로그인
      if (now.difference(startTime).inMilliseconds < expiresIn) {
        await ref
            .read(localLoginViewModelProvider.notifier)
            .postLocalLogin(
              params: LocalLoginParams(
                email: email,
                password: password,
                keepLoggedIn: true,
              ),
            );

        if (mounted) {
          context.goNamed(AppRoutes.home.name);
        }
        return;
      }
    }

    context.goNamed(AppRoutes.localLogin.name);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(localLoginViewModelProvider);

    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: ScaleColorConfig.primary80,
      ),
    );
  }
}
