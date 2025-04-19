import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class CustomMainTopBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomMainTopBar({required this.onSearchIconTap, super.key});
  final VoidCallback onSearchIconTap;

  @override
  Widget build(BuildContext context) {
    final TopBarIcon icon = TopBarIcon();

    return Container(
      color: ScaleColorConfig.primary80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 86,
        leading: Assets.image.logo.image(),
        actions: TopBarIcon.toList(<Widget>[
          // TODO: 아직 알림 기능이 없어서 임시적으로 주석처리
          // icon.notification(onTap: () {}, alert: true),
          icon.search(onTap: onSearchIconTap),
        ]),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
