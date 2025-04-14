import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

enum CustomProfilePhotoBtcType { camera, pencil }

class CustomProfilePhotoBtc extends StatelessWidget {
  const CustomProfilePhotoBtc({
    required this.type,
    required this.onPressed,
    super.key,
  });

  final CustomProfilePhotoBtcType type;
  final VoidCallback? onPressed;

  SvgPicture get _icon {
    switch (type) {
      case CustomProfilePhotoBtcType.camera:
        return Assets.icon.media.camera2Line.svg(
          colorFilter: const ColorFilter.mode(
            ScaleColorConfig.neutral100,
            BlendMode.srcIn,
          ),
          width: 18,
        );

      case CustomProfilePhotoBtcType.pencil:
        return Assets.icon.editor.pencil1Line.svg(
          colorFilter: const ColorFilter.mode(
            ScaleColorConfig.neutral100,
            BlendMode.srcIn,
          ),
          width: 13,
        );
    }
  }

  EdgeInsets get _padding {
    switch (type) {
      case CustomProfilePhotoBtcType.camera:
        return const EdgeInsets.all(5);

      case CustomProfilePhotoBtcType.pencil:
        return const EdgeInsets.all(3.5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          color: ScaleColorConfig.primary5,
          shape: BoxShape.circle,
        ),
        padding: _padding,
        child: _icon,
      ),
    );
  }
}
