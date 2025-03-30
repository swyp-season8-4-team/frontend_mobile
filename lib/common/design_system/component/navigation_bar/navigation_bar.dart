import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend_mobile/common/design_system/component/navigation_bar/highlight_painter.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class NavigationBarType {
  NavigationBarType({
    required this.svg,
    required this.label,
    required this.onTap,
  });

  final SvgGenImage svg;
  final String label;
  final VoidCallback onTap;
}

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({required this.list, super.key});

  final List<NavigationBarType> list;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _currentIndex = 0;
  int? _pressedIndex;

  Widget _item({required NavigationBarType item, required int index}) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      onTapDown: (_) {
        setState(() {
          _pressedIndex = index;
        });
      },
      onTapUp: (_) {
        setState(() {
          _pressedIndex = null;
        });
      },
      onTapCancel: () {
        setState(() {
          _pressedIndex = null;
        });
      },
      child: SizedBox(
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomPaint(
              painter: HighlightPainter(
                color:
                    _pressedIndex == index
                        ? ScaleColorConfig.neutral70
                        : Colors.transparent,
              ),
              child: SvgPicture.asset(
                item.svg.path,
                colorFilter: ColorFilter.mode(
                  /// TODO: 색 정의되면 수정
                  _currentIndex == index
                      ? ScaleColorConfig.primary70
                      : const Color(0xFF271900),
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.label,
              style: textTheme.bodySmall?.copyWith(
                color:
                    _currentIndex == index
                        ? ScaleColorConfig.primary50
                        : colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: ScaleColorConfig.surface90,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List<Widget>.generate(widget.list.length, (int index) {
          final NavigationBarType item = widget.list[index];

          return Expanded(child: _item(item: item, index: index));
        }),
      ),
    );
  }
}
