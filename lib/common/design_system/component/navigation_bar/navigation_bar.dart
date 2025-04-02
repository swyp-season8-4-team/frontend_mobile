import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/util/highlight_painter.dart';

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
  const CustomNavigationBar({required this.list, super.key})
    : assert(list.length <= 5, 'List length must be 5 or less.');

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

  /// 네비게이션 아이템이 최대 5개고, 각각의 아이템 사이의 간격이 20(피그마에 정의된 값)일 때만 유효
  /// 마지막 아이템만 margin 20을 주지 않는 식으로 구현했지만, 마지막 아이템 영역만 상대적으로 커지는 문제가 발생
  /// Expanded를 사용하기 때문에 마지막 아이템은 20만큼의 영역을 더 차지
  /// 따라서, 모두 동일하게 margin을 할당해야 함
  EdgeInsets _margin({required int index}) {
    switch (widget.list.length) {
      case 1:
        return EdgeInsets.zero;

      case 2:
        switch (index) {
          case 0:
            return const EdgeInsets.only(right: 10);
          case 1:
            return const EdgeInsets.only(left: 10);
          default:
            return EdgeInsets.zero;
        }

      case 3:
        switch (index) {
          case 0:
            return const EdgeInsets.only(right: 13);
          case 1:
            return const EdgeInsets.symmetric(horizontal: 7);
          case 2:
            return const EdgeInsets.only(left: 13);
          default:
            return EdgeInsets.zero;
        }

      case 4:
        switch (index) {
          case 0:
            return const EdgeInsets.only(right: 15);
          case 1:
            return const EdgeInsets.only(left: 5, right: 10);
          case 2:
            return const EdgeInsets.only(left: 10, right: 5);
          case 3:
            return const EdgeInsets.only(left: 15);
          default:
            return EdgeInsets.zero;
        }

      case 5:
        switch (index) {
          case 0:
            return const EdgeInsets.only(right: 16);
          case 1:
            return const EdgeInsets.only(left: 4, right: 12);
          case 2:
            return const EdgeInsets.only(left: 8, right: 8);
          case 3:
            return const EdgeInsets.only(left: 12, right: 4);
          case 4:
            return const EdgeInsets.only(left: 16);
          default:
            return EdgeInsets.zero;
        }

      default:
        return EdgeInsets.zero;
    }
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

          return Expanded(
            child: Container(
              margin: _margin(index: index),
              child: _item(item: item, index: index),
            ),
          );
        }),
      ),
    );
  }
}
