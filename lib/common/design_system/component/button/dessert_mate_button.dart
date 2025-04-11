import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/design_system/foundation/shadow/shadow_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class CustomDessertMateButton extends StatelessWidget {
  const CustomDessertMateButton({required this.onPressed, super.key});

  final VoidCallback? onPressed;

  WidgetStateProperty<Color?> get _backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return ScaleColorConfig.primary70;
        }

        /// Enabled
        return ScaleColorConfig.primary80;
      });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        boxShadow: ShadowConfig().level1,
        borderRadius: BorderRadius.circular(6),
      ),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          minimumSize: Size.zero,
          foregroundColor: ScaleColorConfig.primary20,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: const EdgeInsets.all(2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          textStyle: textTheme.labelLarge,
        ).copyWith(backgroundColor: _backgroundColor),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: ScaleColorConfig.neutral90,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Assets.image.bee.image(width: 20, height: 20),
            ),
            const SizedBox(width: 2),
            const SizedBox(
              child: Text(
                '디저트 메이트',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Color(0xFF504209),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
