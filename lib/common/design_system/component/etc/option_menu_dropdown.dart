import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/design_system/foundation/shadow/shadow_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

/// Option Menu Dropdown
/// https://www.figma.com/design/S1zkOn7DjDJ0b1mcPVJRil/SWYP_%E1%84%8B%E1%85%A2%E1%86%B8_1%E1%84%80%E1%85%B5_%E1%84%83%E1%85%B5%E1%84%8C%E1%85%A5%E1%84%87%E1%85%B5?node-id=40000781-244763&m=dev
class CustomOptionMenuDropdown extends StatelessWidget {
  const CustomOptionMenuDropdown({required this.optionMenus, super.key});
  final List<CustomOptionMenu> optionMenus;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: ScaleColorConfig.neutral100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: ShadowConfig().level2,
      ),
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (optionMenus.isNotEmpty)
              ...List<Widget>.generate(2 * optionMenus.length - 1, (int index) {
                if (index.isOdd) {
                  return Divider(
                    thickness: 1,
                    height: 1,
                    color: colorScheme.outlineVariant,
                  );
                } else {
                  return optionMenus[(index / 2).toInt()];
                }
              }),
          ],
        ),
      ),
    );
  }
}

class CustomOptionMenu extends StatelessWidget {
  const CustomOptionMenu({
    required this.svg,
    required this.text,
    required this.onTap,
    super.key,
  });
  final SvgGenImage svg;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: SizedBox(
          width: 104,
          height: 21,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              svg.svg(
                width: 18,
                height: 18,
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  ScaleColorConfig.neutral20,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: textTheme.bodyMedium?.copyWith(
                  color: ScaleColorConfig.neutral20,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
