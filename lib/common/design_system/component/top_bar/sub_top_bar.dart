import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class CustomSubTopBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomSubTopBar({
    required this.actions,
    this.primary = true,
    super.key,
  });

  final bool primary;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TopBarIcon icon = TopBarIcon();

    return Container(
      color: primary ? ScaleColorConfig.primary80 : ScaleColorConfig.surface90,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 24 + 7,
        leading: icon.leftLine(onTap: () {}),
        title: Text('타이틀', style: textTheme.titleLarge),
        centerTitle: true,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
