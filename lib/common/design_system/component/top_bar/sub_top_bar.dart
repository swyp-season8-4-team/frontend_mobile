import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class CustomSubTopBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomSubTopBar({
    required this.title,
    required this.actions,
    this.primary = true,
    this.leading,
    this.systemOverlayStyle,
    super.key,
  });

  final String title;
  final bool primary;
  final List<Widget> actions;
  final Widget? leading;
  final SystemUiOverlayStyle? systemOverlayStyle;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TopBarIcon icon = TopBarIcon();

    return Container(
      color: primary ? ScaleColorConfig.primary80 : ScaleColorConfig.surface90,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        systemOverlayStyle: systemOverlayStyle,
        backgroundColor: Colors.transparent,
        leadingWidth: 24 + 7,
        leading: leading ?? icon.leftLine(onTap: () => Navigator.pop(context)),
        title: Text(title, style: textTheme.titleLarge),
        centerTitle: true,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
