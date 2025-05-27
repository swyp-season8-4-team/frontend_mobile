import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

/// Default Marker
/// https://www.figma.com/design/S1zkOn7DjDJ0b1mcPVJRil/SWYP_%E1%84%8B%E1%85%A2%E1%86%B8_1%E1%84%80%E1%85%B5_%E1%84%83%E1%85%B5%E1%84%8C%E1%85%A5%E1%84%87%E1%85%B5?node-id=40000687-133098&m=dev
class CustomDefaultMarker extends StatelessWidget {
  const CustomDefaultMarker({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          top: 25,
          child: Container(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: ScaleColorConfig.primary30),
                color: ScaleColorConfig.primary100,
              ),
              constraints: const BoxConstraints(minWidth: 38, maxWidth: 100),
              padding: const EdgeInsets.all(4),
              child: Text(
                text,
                style: textTheme.labelSmall?.copyWith(
                  color: ScaleColorConfig.primary20,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
          ),
        ),
        Assets.image.marker1.image(width: 22, height: 30),
      ],
    );
  }
}
