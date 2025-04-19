import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

class SignUpStep6 extends StatelessWidget {
  const SignUpStep6({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Material(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40),

            Text(
              '회원가입이 완료되었습니다!',
              style: textTheme.titleLarge?.copyWith(
                color: ScaleColorConfig.primary5,
              ),
            ),
            const SizedBox(height: 7),

            Text(
              '디저비 이용을 위해 로그인해주세요',
              style: textTheme.bodyLarge?.copyWith(
                color: ScaleColorConfig.neutral30,
              ),
            ),
            const SizedBox(height: 30),

            Container(
              height: 285,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: const Color.fromRGBO(232, 232, 232, 1),
              child: const Align(child: Text('Illust-area')),
            ),
            const SizedBox(height: 30),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomFillButton.large(
                label: '로그인 가기',
                onPressed: () {
                  context.goNamed(AppRoutes.localLogin.name);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
