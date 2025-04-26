part of '../search_store_view.dart';

class _SearchKeywordList extends ConsumerWidget {
  const _SearchKeywordList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SearchStoreState state = ref.watch(searchStoreViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final SearchStoreViewModel viewmodel = ref.read(
      searchStoreViewModelProvider.notifier,
    );
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final int popularSearchLength =
        state.popularSearches?.searches?.length ?? 0;

    // 인기검색어 or 최근 검색어 불러오기 실패한 경우
    if (state.getRecentSearchesStatus.isFailure ||
        state.getPopularSearchesStatus.isFailure) {
      return _Failure(
        onRetryTap: () {
          viewmodel.getRecentSearches();
          viewmodel.getPopularSearches();
        },
      );
    }

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 16,
            right: 16,
            bottom: 8,
          ),
          child: Row(
            children: <Widget>[
              Text(
                '최근 검색어',
                style: textTheme.titleSmall?.copyWith(
                  color: ScaleColorConfig.primary20,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  if (state.recentSearches.isEmpty) {
                    return;
                  }
                  viewmodel.deleteRecentSearchAll();
                },
                behavior: HitTestBehavior.translucent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Text(
                    '전체삭제',
                    style: textTheme.labelLarge?.copyWith(
                      color: ScaleColorConfig.secondary30,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 28,
          child:
              state.recentSearches.isEmpty
                  ? Center(
                    child: Text(
                      '최근 검색어가 없어요',
                      style: textTheme.labelMedium?.copyWith(
                        color: ScaleColorConfig.neutral40,
                      ),
                    ),
                  )
                  : ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      const SizedBox(width: 16),
                      ...state.recentSearches.map(
                        (RecentSearchModel e) => Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: _RecentSearchItemChip(
                            label: e.keyword,
                            onPressed: () {
                              ref
                                  .read(searchStoreViewModelProvider.notifier)
                                  .getStores(popularKeyword: e.keyword);
                            },
                            onCloseButtonPressed: () {
                              viewmodel.deleteRecentSearch(
                                searchId: e.id.toString(),
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),
                    ],
                  ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorScheme.onInverseSurface,
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '인기 검색어',
                      style: textTheme.titleSmall?.copyWith(
                        color: ScaleColorConfig.primary20,
                      ),
                    ),
                    Text(
                      '${DateFormat('MM.dd').format(state.popularSearches!.lastUpdatedTime)} 업데이트',
                      style: textTheme.labelLarge?.copyWith(
                        color: ScaleColorConfig.neutral40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (popularSearchLength > 0)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _PopularSearches(
                        startIndex: 0,
                        popularSearchLength: popularSearchLength,
                        searches: state.popularSearches!.searches!,
                      ),
                      const SizedBox(width: 8),
                      _PopularSearches(
                        startIndex: 5,
                        popularSearchLength: popularSearchLength,
                        searches: state.popularSearches!.searches!,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PopularSearches extends ConsumerWidget {
  const _PopularSearches({
    required this.startIndex,
    required this.popularSearchLength,
    required this.searches,
  });
  final int startIndex;
  final int popularSearchLength;
  final List<PopularSearchModel> searches;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Column(
        children: <Widget>[
          if (popularSearchLength > startIndex)
            ...List<Widget>.generate(5, (int index) {
              final int currentIndex = startIndex + index;
              final bool isLastItem = index == 4;
              if (currentIndex < popularSearchLength) {
                final PopularSearchModel popularSearch = searches[currentIndex];
                return Padding(
                  padding: EdgeInsets.only(bottom: isLastItem ? 0 : 12),
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(searchStoreViewModelProvider.notifier)
                          .getStores(popularKeyword: popularSearch.keyword);
                    },
                    behavior: HitTestBehavior.translucent,
                    child: _PopularSearch(
                      search: PopularSearchModel(
                        keyword: popularSearch.keyword,
                        searchCount: popularSearch.searchCount,
                        rank: popularSearch.rank,
                        difference: popularSearch.difference,
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
        ],
      ),
    );
  }
}

class _PopularSearch extends StatelessWidget {
  const _PopularSearch({required this.search});
  final PopularSearchModel search;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 20,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 21,
            child: Text(
              search.rank.toString(),
              style: textTheme.labelLarge?.copyWith(
                color: ScaleColorConfig.primary20,
              ),
            ),
          ),

          Expanded(
            child: Text(
              search.keyword,
              style: textTheme.bodySmall?.copyWith(
                color: ScaleColorConfig.primary20,
              ),
            ),
          ),
          const SizedBox(width: 8),
          _buildDifference(context),
        ],
      ),
    );
  }

  Widget _buildDifference(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    // TODO: 타이포 그래피 사용 필요
    const TextStyle differenceTextStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.20,
      letterSpacing: -0.18,
    );
    if (search.difference > 0) {
      return Row(
        children: <Widget>[
          Assets.icon.arrow.a20x20ArrowUpFilled.svg(),
          Text(
            search.difference.abs().toString(),
            style: differenceTextStyle.copyWith(color: colorScheme.accentRed),
          ),
        ],
      );
    } else if (search.difference == 0) {
      return Text(
        'N',
        style: differenceTextStyle.copyWith(color: ScaleColorConfig.error50),
      );
    } else {
      return Row(
        children: <Widget>[
          Assets.icon.arrow.a20x20ArrowDownFilled.svg(),
          Text(
            search.difference.abs().toString(),
            style: differenceTextStyle.copyWith(color: colorScheme.accentBlue),
          ),
        ],
      );
    }
  }
}

class _RecentSearchItemChip extends StatelessWidget {
  const _RecentSearchItemChip({
    required this.label,
    required this.onPressed,
    required this.onCloseButtonPressed,
  });
  final String label;
  final VoidCallback onPressed;
  final VoidCallback onCloseButtonPressed;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: ScaleColorConfig.primary100,
        border: Border.all(color: ScaleColorConfig.neutral50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: onPressed,
            behavior: HitTestBehavior.translucent,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 12,
                top: 6,
                bottom: 6,
                right: 4,
              ),
              child: Text(
                label,
                style: textTheme.labelLarge?.copyWith(
                  color: ScaleColorConfig.primary20,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onCloseButtonPressed,
            behavior: HitTestBehavior.translucent,
            child: Assets.icon.system.closeCircleFill.svg(
              width: 16,
              colorFilter: const ColorFilter.mode(
                ScaleColorConfig.neutral50,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
