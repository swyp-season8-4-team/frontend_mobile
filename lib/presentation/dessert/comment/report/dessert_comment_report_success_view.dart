import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/button/pill_button.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

class DessertCommentReportSuccessView extends StatelessWidget {
  const DessertCommentReportSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Material(
      child: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '소중한 신고 감사합니다',
              style: textTheme.titleLarge?.copyWith(
                color: const Color.fromRGBO(25, 25, 25, 1),
              ),
            ),
            const SizedBox(height: 15),

            Text(
              '디저비 커뮤니티의 건강한 소통을 위해\n검토 후 적절히 조치하겠습니다',
              style: textTheme.bodyMedium?.copyWith(
                color: ScaleColorConfig.neutral30,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 39),

            CustomPillButton(
              width: 150,
              label: '모집글로 이동',
              onPressed: () {
                while (context.canPop()) {
                  context.pop();
                }

                context.pushNamed(AppRoutes.dessertBoard.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
