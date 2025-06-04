part of '../store_detail_view.dart';

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  const _TabBarDelegate({
    required this.storeDetail,
    required this.thumbnailImageUrls,
    required this.tabController,
    this.key,
  });

  final StoreDetailModel storeDetail;
  final List<String> thumbnailImageUrls;
  final TabController tabController;
  final Key? key;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      key: key,
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
            label: '메뉴',
            index: 0,
            count: storeDetail.menus.length,
          ),
          _tab(
            context: context,
            label: '리뷰',
            index: 1,
            count: storeDetail.storeReviews?.length,
          ),
          _tab(
            context: context,
            label: '사진',
            index: 2,
            count: thumbnailImageUrls.length,
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
