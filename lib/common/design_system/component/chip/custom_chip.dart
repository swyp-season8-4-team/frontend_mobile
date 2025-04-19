import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    required this.color,
    required this.label,
    required this.onPressed,
    required this.side,
    this.labelColor,
    this.trailing,
    super.key,
  });

  final WidgetStateProperty<Color?>? color;
  final String label;
  final VoidCallback? onPressed;

  /// border 스타일
  final BorderSide side;

  final Color? labelColor;

  /// label 뒤에 오는 위젯
  /// ex. close 아이콘, 숫자 등
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return RawChip(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: side,
      ),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            label,
            style: textTheme.labelLarge?.copyWith(
              color: labelColor ?? ScaleColorConfig.primary20,
            ),
          ),
          if (trailing != null) ...<Widget>[
            const SizedBox(width: 4),
            trailing!,
          ],
        ],
      ),
      onPressed: onPressed,
      visualDensity: const VisualDensity(vertical: -4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      labelPadding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
