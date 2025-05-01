import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class DessertListImage extends StatelessWidget {
  const DessertListImage({required this.imageUrl, super.key});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: 80,
      height: 80,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (BuildContext context, String url) {
          return Container(color: ScaleColorConfig.neutral70);
        },
        errorWidget: (BuildContext context, String url, Object error) {
          return Container(
            color: ScaleColorConfig.neutral60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Assets.icon.file.noImageStatus.svg(
                  colorFilter: const ColorFilter.mode(
                    ScaleColorConfig.neutral40,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  'No Image',
                  style: textTheme.labelSmall?.copyWith(
                    color: ScaleColorConfig.neutral40,
                  ),
                ),
              ],
            ),
          );
        },
        fit: BoxFit.cover,
      ),
    );
  }
}
