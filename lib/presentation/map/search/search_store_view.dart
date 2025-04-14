import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/pill_outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/chip/input_chip.dart';
import 'package:frontend_mobile/common/design_system/component/search/search.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/design_system/foundation/foundation.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading_overlay.dart';
import 'package:frontend_mobile/domain/model/search/popular_searchs_model.dart';
import 'package:frontend_mobile/domain/model/search/recent_search_model.dart';
import 'package:frontend_mobile/presentation/map/search/search_store_view_model.dart';
import 'package:intl/intl.dart';

class SearchStoreView extends ConsumerStatefulWidget {
  const SearchStoreView({super.key});

  @override
  ConsumerState<SearchStoreView> createState() => _SearchStoreViewState();
}

class _SearchStoreViewState extends ConsumerState<SearchStoreView> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final SearchStoreState state = ref.watch(searchStoreViewModelProvider);
    final SearchStoreViewModel viewmodel = ref.read(
      searchStoreViewModelProvider.notifier,
    );

    // TODO: 페이지 전환 로딩 UI 구현 필요
    if (state.isFirstPageLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final int popularSearchLength =
        state.popularSearches?.searches?.length ?? 0;

    return CustomLoadingOverlay(
      isLoading: state.isLoading,
      child: Scaffold(
        appBar: const CustomSubTopBar(title: '검색', actions: <Widget>[]),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(child: CustomSearch(onSubmitted: (String val) {})),
                    const SizedBox(width: 10),
                    CustomFillButton.small(
                      label: '검색',
                      width: 74,
                      onPressed: () {},
                      backgroundColor: CustomFillButtonColor.olive,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              if (state.getRecentSearchesStatus.isFailure ||
                  state.getPopularSearchesStatus.isFailure)
                Padding(
                  padding: const EdgeInsets.only(top: 198),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Assets.icon.system.warningFill.svg(
                          colorFilter: const ColorFilter.mode(
                            ScaleColorConfig.primary80,
                            BlendMode.srcIn,
                          ),
                          width: 51.4,
                          height: 51.4,
                        ),
                        const SizedBox(height: 8.29),
                        Text(
                          '일시적인 오류로\n정보를 불러올 수 없어요',
                          style: textTheme.titleMedium?.copyWith(
                            color: ScaleColorConfig.primary20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 14),
                        CustomPillOutlineButton.medium(
                          width: 126,
                          label: '다시 시도',
                          onPressed: () {
                            viewmodel.getRecentSearches();
                            viewmodel.getRecentSearches();
                          },
                          isSelected: false,
                        ),
                      ],
                    ),
                  ),
                )
              else
                Column(
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
                                      child: CustomInputChip(
                                        label: e.keyword,
                                        onPressed: () {
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PopularSearches extends StatelessWidget {
  const _PopularSearches({
    required this.startIndex,
    required this.popularSearchLength,
    required this.searches,
  });
  final int startIndex;
  final int popularSearchLength;
  final List<PopularSearchModel> searches;

  @override
  Widget build(BuildContext context) {
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
                  child: _PopularSearch(
                    search: PopularSearchModel(
                      keyword: popularSearch.keyword,
                      searchCount: popularSearch.searchCount,
                      rank: popularSearch.rank,
                      difference: popularSearch.difference,
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
