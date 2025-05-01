part of '../my_dessert_mate_view.dart';

class _SavedMate extends ConsumerStatefulWidget {
  const _SavedMate();

  @override
  ConsumerState<_SavedMate> createState() => _SavedMateState();
}

class _SavedMateState extends ConsumerState<_SavedMate> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final MyDessertMateViewModel viewmodel = ref.read(
      myDessertMateViewModelProvider.notifier,
    );

    final MyDessertMateState state = ref.watch(myDessertMateViewModelProvider);

    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: _MateHeader(
            widget: Container(
              color: ScaleColorConfig.primary100,
              padding: const EdgeInsets.only(top: 60, bottom: 20),
              child: Row(
                children: <Widget>[
                  CustomSuggestiveChip(
                    label: '전체',
                    onPressed: () {
                      viewmodel.updateTabFilter(
                        tabIndex: 0,
                        filter: TabFilterStatus.all,
                      );
                    },
                    isSelected:
                        state.tabsFilter
                            .firstWhere(
                              (({TabFilterStatus filter, int tabIndex}) e) =>
                                  e.tabIndex == 0,
                            )
                            .filter ==
                        TabFilterStatus.all,
                  ),
                  const SizedBox(width: 6),
                  CustomSuggestiveChip(
                    label: '모집중',
                    onPressed: () {
                      viewmodel.updateTabFilter(
                        tabIndex: 0,
                        filter: TabFilterStatus.isRecruiting,
                      );
                    },
                    labelColor: ScaleColorConfig.error40,
                    isSelected:
                        state.tabsFilter
                            .firstWhere(
                              (({TabFilterStatus filter, int tabIndex}) e) =>
                                  e.tabIndex == 0,
                            )
                            .filter ==
                        TabFilterStatus.isRecruiting,
                  ),
                  const SizedBox(width: 6),
                  CustomSuggestiveChip(
                    label: '모집마감',
                    onPressed: () {
                      viewmodel.updateTabFilter(
                        tabIndex: 0,
                        filter: TabFilterStatus.recruitDone,
                      );
                    },
                    isSelected:
                        state.tabsFilter
                            .firstWhere(
                              (({TabFilterStatus filter, int tabIndex}) e) =>
                                  e.tabIndex == 0,
                            )
                            .filter ==
                        TabFilterStatus.recruitDone,
                  ),
                  const Spacer(),
                  Text(
                    '· 최신순',
                    style: textTheme.labelLarge?.copyWith(
                      color: ScaleColorConfig.neutral20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_savedMate.isEmpty)
          const _Empty()
        else
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              final MateDetailModel mate = _savedMate[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: DessertListCard(
                  bookmarkSelected: false,
                  onBookMarkTap: () {},

                  onCardTap: () {
                    context.pushNamed(
                      AppRoutes.dessertPost.name,
                      extra: mate.mateUuid,
                    );
                  },
                  mate: mate,
                ),
              );
            }, childCount: _savedMate.length),
          ),
      ],
    );
  }

  // 찜한
  List<MateDetailModel> get _savedMate {
    final MyDessertMateState state = ref.read(myDessertMateViewModelProvider);
    final List<MateDetailModel> mates =
        state.data.mates.where((MateDetailModel e) => e.saved).toList();

    return switch (state.tabsFilter[0].filter) {
      TabFilterStatus.all => mates,
      TabFilterStatus.isRecruiting =>
        mates.where((MateDetailModel e) => e.recruitYn).toList(),
      TabFilterStatus.recruitDone =>
        mates.where((MateDetailModel e) => !e.recruitYn).toList(),
    };
  }
}
