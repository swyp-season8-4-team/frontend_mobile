part of '../my_dessert_mate_view.dart';

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  const _TabBarDelegate({
    required this.mate,
    required this.tabController,
    required this.userUuid,
  });

  final MateModel mate;
  final TabController tabController;
  final String userUuid;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        color: ScaleColorConfig.surface90,
        border: Border(bottom: BorderSide(color: ScaleColorConfig.surface70)),
      ),
      child: TabBar(
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: const BoxDecoration(
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
          return Colors.transparent;
        }),
        tabs: <Widget>[
          _tab(
            context: context,
            label: '찜한',
            index: 0,
            count: mate.mates.where((MateDetailModel e) => e.saved).length,
          ),
          _tab(
            context: context,
            label: '참여중',
            index: 1,
            // TODO: enum 이용 필요
            count:
                mate.mates
                    .where((MateDetailModel e) => e.applyStatus == 'APPROVED')
                    .length,
          ),
          _tab(
            context: context,
            label: '내가 만든',
            index: 2,
            count:
                mate.mates
                    .where((MateDetailModel e) => e.userUuid == userUuid)
                    .length,
          ),
          // TODO: 추후 구현 예정
          // _tab(context: context, label: '디저트메이트', index: 2),
        ],
      ),
    );
  }

  Widget _tab({
    required BuildContext context,
    required int index,
    required String label,
    int? count,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(label),
          if (count != null) ...<Widget>[
            const SizedBox(width: 4),
            tabController.index == index
                ? CustomNumberBadge(number: count, error: false)
                : Text(
                  count >= 1000 ? '999+' : count.toString(),
                  style: textTheme.labelSmall?.copyWith(
                    color: ScaleColorConfig.neutral50,
                  ),
                ),
          ],
        ],
      ),
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class _MateHeader extends SliverPersistentHeaderDelegate {
  _MateHeader({required this.widget});

  Widget widget;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return widget;
  }

  @override
  double get maxExtent => 106;

  @override
  double get minExtent => 106;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
