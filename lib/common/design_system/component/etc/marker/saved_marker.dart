import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/design_system/foundation/shadow/shadow_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

/// Saved Marker
/// https://www.figma.com/design/S1zkOn7DjDJ0b1mcPVJRil/SWYP_%E1%84%8B%E1%85%A2%E1%86%B8_1%E1%84%80%E1%85%B5_%E1%84%83%E1%85%B5%E1%84%8C%E1%85%A5%E1%84%87%E1%85%B5?node-id=40000687-133098&m=dev
class CustomSavedMarker extends StatelessWidget {
  const CustomSavedMarker({required this.backgroundColor, super.key});
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor,
        boxShadow: ShadowConfig().level1,
      ),
      width: 32,
      height: 32,
      alignment: Alignment.center,
      child: Assets.image.flowerFilled.image(
        width: 24,
        height: 24,
        color: ScaleColorConfig.primary100,
      ),
    );
  }
}
