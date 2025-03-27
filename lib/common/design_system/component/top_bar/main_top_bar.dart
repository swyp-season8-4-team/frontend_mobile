import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class CustomMainTopBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomMainTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TopBarIcon icon = TopBarIcon();

    return Container(
      color: ScaleColorConfig.primary80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 86,
        leading: Image.asset(Assets.image.logo.path),
        actions: TopBarIcon.toList(<Widget>[
          icon.notification(onTap: () {}, alert: true),
          icon.search(onTap: () {}),
        ]),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
