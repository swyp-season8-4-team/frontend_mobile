import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class SegmentType {
  SegmentType({required this.tab, required this.child});

  /// TabBar 안에 들어가는 텍스트
  final String tab;

  /// TabBarView에 들어가는 위젯
  final Widget child;
}

class CustomSegment extends StatelessWidget {
  const CustomSegment({
    required this.first,
    required this.second,
    this.physics,
    super.key,
  });

  final SegmentType first;
  final SegmentType second;

  /// TabBarView physics
  final ScrollPhysics? physics;

  BorderRadius get _borderRadius => BorderRadius.circular(6);

  Widget _tabBar({required TextTheme textTheme}) {
    return ClipRRect(
      borderRadius: _borderRadius,
      child: Material(
        color: ScaleColorConfig.neutral60,
        child: SizedBox(
          width: 208,
          child: IntrinsicHeight(
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: ScaleColorConfig.secondary40,
                borderRadius: _borderRadius,
              ),
              labelStyle: textTheme.labelLarge?.copyWith(
                color: ScaleColorConfig.neutral100,
              ),
              unselectedLabelStyle: textTheme.labelLarge?.copyWith(
                color: ScaleColorConfig.neutral10,
              ),
              overlayColor: WidgetStateColor.resolveWith((
                Set<WidgetState> states,
              ) {
                return ScaleColorConfig.neutral50;
              }),
              splashBorderRadius: _borderRadius,
              tabs: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text(first.tab)],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text(second.tab)],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tabBarView() {
    return Expanded(
      child: TabBarView(
        physics: physics,
        children: <Widget>[first.child, second.child],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[_tabBar(textTheme: textTheme), _tabBarView()],
      ),
    );
  }
}
