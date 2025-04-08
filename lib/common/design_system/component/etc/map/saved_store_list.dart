import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/checkbox/checkbox.dart';
import 'package:frontend_mobile/common/design_system/component/etc/marker/saved_marker.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class CustomSavedStoreList extends StatelessWidget {
  const CustomSavedStoreList({
    required this.leftIconColor,
    required this.name,
    required this.storeLength,
    required this.onCheckboxTap,
    this.selected = false,
    this.hasOption = false,
    this.backgroundColor,
    super.key,
  });
  final Color leftIconColor;
  final String name;
  final int storeLength;
  final bool selected;
  final VoidCallback onCheckboxTap;
  final bool hasOption;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 60,
      color: backgroundColor,
      child: Row(
        children: <Widget>[
          CustomSavedMarker(backgroundColor: leftIconColor),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  name,
                  style: textTheme.titleSmall?.copyWith(color: Colors.black),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Assets.icon.map.locationLine.svg(
                      width: 14,
                      height: 14,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                        ScaleColorConfig.neutral50,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      storeLength.toString(),
                      style: textTheme.labelMedium?.copyWith(
                        color: ScaleColorConfig.neutral50,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (hasOption)
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 6),
              child: Assets.icon.menu.more2Fill.svg(
                colorFilter: const ColorFilter.mode(
                  ScaleColorConfig.neutral50,
                  BlendMode.srcIn,
                ),
              ),
            )
          else
            CustomCheckBox(onTap: onCheckboxTap),
        ],
      ),
    );
  }
}
