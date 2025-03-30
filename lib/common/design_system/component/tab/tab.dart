import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';

class TabItem {
  TabItem({required this.label, this.number});

  final String label;
  final int? number;
}

class CustomTab extends StatefulWidget {
  const CustomTab({required this.list, super.key});

  final List<TabItem> list;

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(item.label),

        if (item.number != null) ...<Widget>[
          const SizedBox(width: 4),
          Text(
            item.number.toString(),
            style:
                _tabController.index == index
                    /// TODO: 숫자 뱃지 적용할 예정
                    ? textTheme.labelSmall?.copyWith(
                      color: ScaleColorConfig.error50,
                    )
                    : textTheme.labelSmall?.copyWith(
                      color: ScaleColorConfig.neutral50,
                    ),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Material(
      color: ScaleColorConfig.surface90,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: ScaleColorConfig.surface70)),
        ),
        child: TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: ScaleColorConfig.surface90,
            border: Border(
              bottom: BorderSide(color: ScaleColorConfig.primary70, width: 2.5),
            ),
          ),
          dividerColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          labelStyle: textTheme.labelLarge?.copyWith(
            color: ScaleColorConfig.neutral30,
          ),
          unselectedLabelStyle: textTheme.labelLarge?.copyWith(
            color: ScaleColorConfig.neutral30,
          ),
          overlayColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
            return ScaleColorConfig.surface80;
          }),
          tabs: List<Tab>.generate(widget.list.length, (int index) {
            final TabItem item = widget.list[index];

            return Tab(child: _tab(item: item, index: index));
          }),
        ),
      ),
    );
  }
}
