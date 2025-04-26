part of '../store_detail_view.dart';

class _DessertImages extends ConsumerWidget {
  const _DessertImages();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StoreDetailState state = ref.watch(storeDetailViewModelProvider);

    // TODO: 타이포 그래피 사용 필요
    const TextStyle baseTextStyle = TextStyle(
      color: Color(0xFF898989),
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.30,
      letterSpacing: -0.18,
    );

    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    // final List<String> dessertImages =
    //     state.storeDetail!.menus
    //         .map((StoreDetailMenuModel e) => e.images ?? <String>[])
    //         .expand((List<String> e) => e)
    //         .toList();

    final List<String> dessertImages = state.thumbnailImageUrls;
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: _ImageHeader(
            widget: Container(
              color: ScaleColorConfig.neutral100,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '· 최신순',
                          style: baseTextStyle.copyWith(
                            color: const Color(0xFF272727),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Assets.icon.system.chart1Filled.svg(
                          width: 16,
                          height: 16,
                          colorFilter: const ColorFilter.mode(
                            Color(0xFF898989),
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 2),
                        const Text('업데이트 주기: 하루 단위', style: baseTextStyle),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                    color: colorScheme.outlineVariant,
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          sliver: SliverMasonryGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            itemBuilder: (BuildContext context, int index) {
              final String dessertImage = dessertImages[index];

              return ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: dessertImage,
                  fit: BoxFit.cover,
                ),
              );
            },
            childCount: dessertImages.length,
          ),
        ),
      ],
    );
  }
}

class _ImageHeader extends SliverPersistentHeaderDelegate {
  _ImageHeader({required this.widget});

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
  double get maxExtent => 77;

  @override
  double get minExtent => 77;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
