part of '../my_dessert_mate_view.dart';

class _MyMate extends ConsumerStatefulWidget {
  const _MyMate();

  @override
  ConsumerState<_MyMate> createState() => _MyMateState();
}

class _MyMateState extends ConsumerState<_MyMate> {
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
            widget: Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 20),
              child: Row(
                children: <Widget>[
                  CustomSuggestiveChip(
                    label: '전체',
                    onPressed: () {
                      viewmodel.updateTabFilter(
                        tabIndex: 2,
                        filter: TabFilterStatus.all,
                      );
                    },
                    isSelected:
                        state.tabsFilter
                            .firstWhere(
                              (({TabFilterStatus filter, int tabIndex}) e) =>
                                  e.tabIndex == 2,
                            )
                            .filter ==
                        TabFilterStatus.all,
                  ),
                  const SizedBox(width: 6),
                  CustomSuggestiveChip(
                    label: '모집중',
                    onPressed: () {
                      viewmodel.updateTabFilter(
                        tabIndex: 2,
                        filter: TabFilterStatus.isRecruiting,
                      );
                    },
                    labelColor: ScaleColorConfig.error40,
                    isSelected:
                        state.tabsFilter
                            .firstWhere(
                              (({TabFilterStatus filter, int tabIndex}) e) =>
                                  e.tabIndex == 2,
                            )
                            .filter ==
                        TabFilterStatus.isRecruiting,
                  ),
                  const SizedBox(width: 6),
                  CustomSuggestiveChip(
                    label: '모집마감',
                    onPressed: () {
                      viewmodel.updateTabFilter(
                        tabIndex: 2,
                        filter: TabFilterStatus.recruitDone,
                      );
                    },
                    isSelected:
                        state.tabsFilter
                            .firstWhere(
                              (({TabFilterStatus filter, int tabIndex}) e) =>
                                  e.tabIndex == 2,
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
        ..._myMate.map(
          (MateDetailModel e) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: DessertListCard(
              bookmarkSelected: false,
              onBookMarkTap: () {},

              onCardTap: () {
                context.pushNamed(
                  AppRoutes.dessertPost.name,
                  extra: e.mateUuid,
                );
              },
              mate: e,
            ),
          ),
        ),
      ],
    );
  }

  // 유저가 만든
  List<MateDetailModel> get _myMate {
    final MyDessertMateState state = ref.read(myDessertMateViewModelProvider);
    final UserState userState = ref.read(userViewModelProvider);
    final List<MateDetailModel> mates =
        state.data.mates
            .where((MateDetailModel e) => e.userUuid == userState.data.userUuid)
            .toList();

    return switch (state.tabsFilter[2].filter) {
      TabFilterStatus.all => mates,
      TabFilterStatus.isRecruiting =>
        mates.where((MateDetailModel e) => e.recruitYn).toList(),
      TabFilterStatus.recruitDone =>
        mates.where((MateDetailModel e) => !e.recruitYn).toList(),
    };
  }
}
