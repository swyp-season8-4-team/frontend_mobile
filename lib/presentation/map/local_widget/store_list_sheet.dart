part of '../map_view.dart';

class _StoreListSheet extends ConsumerWidget {
  const _StoreListSheet({
    required this.draggableScrollableController,
    required this.snapSize,
    required this.isStoreListAppBarVisible,
  });
  final DraggableScrollableController draggableScrollableController;
  final double snapSize;
  final bool isStoreListAppBarVisible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final MapState state = ref.watch(mapViewModelProvider);

    return Positioned.fill(
      child: DraggableScrollableSheet(
        controller: draggableScrollableController,
        minChildSize: 0,
        initialChildSize: 0,
        snap: true,
        snapSizes: const <double>[0.5],
        builder: (BuildContext context, ScrollController scrollController) {
          return SafeArea(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft:
                      isStoreListAppBarVisible
                          ? Radius.zero
                          : const Radius.circular(28),
                  topRight:
                      isStoreListAppBarVisible
                          ? Radius.zero
                          : const Radius.circular(28),
                ),
                color: ScaleColorConfig.white,
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: <Widget>[
                  isStoreListAppBarVisible
                      ? const SliverToBoxAdapter(child: SizedBox.shrink())
                      : SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          alignment: Alignment.center,
                          child: Container(
                            width: 32,
                            height: 4,
                            decoration: BoxDecoration(
                              color: ScaleColorConfig.neutral30,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                  SliverPinnedToBoxAdapter(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 6,
                        right: 16,
                        left: 16,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '전체 리스트',
                            style: textTheme.titleMedium?.copyWith(
                              color: ScaleColorConfig.primary20,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${state.userStores.length}',
                            style: textTheme.titleMedium?.copyWith(
                              color: ScaleColorConfig.success50,
                            ),
                          ),
                          const Spacer(),
                          if (state.userStores.isNotEmpty)
                            CustomOutlineButton.xSmall(
                              label: '새 리스트 추가',
                              onPressed: () {
                                context.pushNamed(
                                  AppRoutes.addUserStoreList.name,
                                );
                              },
                              svg: Assets.icon.system.addCircleLine,
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (state.userStores.isEmpty)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 74),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '아직 찜한 리스트가 없어요\n새로운 리스트를 추가해보는 건 어떠세요?',
                              style: textTheme.bodyMedium?.copyWith(
                                color: ScaleColorConfig.neutral30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            CustomOutlineButton.xSmall(
                              label: '새 리스트 추가',
                              onPressed: () {
                                context.pushNamed(
                                  AppRoutes.addUserStoreList.name,
                                );
                              },
                              svg: Assets.icon.system.addCircleLine,
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    SliverList(
                      delegate: SliverChildBuilderDelegate((
                        BuildContext context,
                        int index,
                      ) {
                        final UserStoreListModel userStoreList =
                            state.userStores[index];
                        return Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: CustomSavedStoreListItem.withOptionMenus(
                                leftIconColor: userStoreList.iconColor.color,
                                name: userStoreList.listName,
                                storeLength:
                                    userStoreList.storeData?.length ?? 0,

                                // TODO: 옵션 기능은 추후 구현 예정
                                optionMenus: const <CustomOptionMenu>[],
                                optionMenusVisible: false,
                                onOptionMenusTap: () {},
                                onTap: () {},
                              ),
                            ),
                            const Divider(color: ScaleColorConfig.neutral50),
                          ],
                        );
                      }, childCount: state.userStores.length),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
