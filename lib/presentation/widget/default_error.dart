import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/button/pill_outline_button.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

/// 알 수 없는 에러가 발생한 경우, 표시해줄 에러 UI
class DefaultError extends StatelessWidget {
  const DefaultError({required this.onRetry, super.key});

  // 다시 시도 버튼 클릭 이벤트 콜백
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 198),
      child: Center(
        child: Column(
          children: <Widget>[
            Assets.icon.system.warningFill.svg(
              colorFilter: const ColorFilter.mode(
                ScaleColorConfig.primary80,
                BlendMode.srcIn,
              ),
              width: 51.4,
              height: 51.4,
            ),
            const SizedBox(height: 8.29),
            Text(
              '일시적인 오류로\n정보를 불러올 수 없어요',
              style: textTheme.titleMedium?.copyWith(
                color: ScaleColorConfig.primary20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),
            CustomPillOutlineButton.medium(
              width: 126,
              label: '다시 시도',
              onPressed: onRetry,
              isSelected: false,
            ),
          ],
        ),
      ),
    );
  }
}
