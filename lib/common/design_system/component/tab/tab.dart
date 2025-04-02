import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/badge/number_badge.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class TabItem {
  TabItem({required this.label, this.number});

  final String label;
  final int? number;
}

class TabType {
  TabType({required this.tabItem, required this.child});

  /// TabBar 안에 들어가는 tabItem
  final TabItem tabItem;

  /// TabBarView에 들어가는 위젯
  final Widget child;
}

class CustomTab extends StatefulWidget {
  const CustomTab({required this.list, this.physics, super.key});

  final List<TabType> list;

  /// TabBarView physics
  final ScrollPhysics? physics;

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  int? _pressedIndex;

  /// tab 사이 간격
  double get _tabGap => 4;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.list.length, vsync: this);
    _tabController.addListener(_listener);
  }

  @override
  void dispose() {
    _tabController.removeListener(_listener);
    _tabController.dispose();
    super.dispose();
  }

  void _listener() {
    setState(() {});
  }

  Widget _tab({required TabItem item, required int index}) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return AnimatedContainer(
      width: 79,
      height: double.infinity,
      margin: EdgeInsets.only(
        right: index != _tabController.length - 1 ? _tabGap : 0,
      ),
      duration: kTabScrollDuration,
      color:
          _pressedIndex == index
              ? ScaleColorConfig.surface80
              : Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(item.label),
          if (item.number != null) ...<Widget>[
            const SizedBox(width: 4),
            _tabController.index == index
                ? CustomNumberBadge(number: item.number!)
                : Text(
                  item.number! >= 1000 ? '999+' : item.number.toString(),
                  style: textTheme.labelSmall?.copyWith(
                    color: ScaleColorConfig.neutral50,
                  ),
                ),
          ],
        ],
      ),
    );
  }

  Widget _tabBar({required TextTheme textTheme}) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: ScaleColorConfig.surface70)),
      ),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        tabAlignment: TabAlignment.center,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: const BoxDecoration(
          color: ScaleColorConfig.surface90,
          border: Border(
            bottom: BorderSide(color: ScaleColorConfig.primary70, width: 2.5),
          ),
        ),
        indicatorPadding: EdgeInsets.only(
          right: _currentIndex != _tabController.length - 1 ? _tabGap : 0,
        ),
        dividerColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        labelPadding: EdgeInsets.zero,
        labelStyle: textTheme.labelLarge?.copyWith(
          color: ScaleColorConfig.neutral30,
        ),
        unselectedLabelStyle: textTheme.labelLarge?.copyWith(
          color: ScaleColorConfig.neutral30,
        ),
        overlayColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
          return Colors.transparent;
        }),
        tabs: List<Widget>.generate(widget.list.length, (int index) {
          final TabType tabType = widget.list[index];

          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              _tabController.animateTo(index);
              _currentIndex = index;
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
            child: _tab(item: tabType.tabItem, index: index),
          );
        }),
      ),
    );
  }

  Widget _tabBarView() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        physics: widget.physics,
        children: widget.list.map((TabType e) => e.child).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Material(
      color: ScaleColorConfig.surface90,
      child: Column(
        children: <Widget>[_tabBar(textTheme: textTheme), _tabBarView()],
      ),
    );
  }
}
