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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final MapViewModel viewmodel = ref.read(mapViewModelProvider.notifier);

    final UserStoreListState userStoreListState = ref.watch(
      userStoreListViewModelProvider,
    );
    final UserStoreListViewModel userStoreListViewModel = ref.read(
      userStoreListViewModelProvider.notifier,
    );

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
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 6,
                        right: 16,
                        left: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(color: colorScheme.outlineVariant),
                        ),
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
                            '${userStoreListState.userStoreLists.length}',
                            style: textTheme.titleMedium?.copyWith(
                              color: ScaleColorConfig.success50,
                            ),
                          ),
                          const Spacer(),
                          if (userStoreListState.userStoreLists.isNotEmpty)
                            CustomOutlineButton.xSmall(
                              label: '새 리스트 추가',
                              onPressed: () async {
                                final Object? result = await context.pushNamed(
                                  AppRoutes.addUserStoreList.name,
                                );

                                if (result == true && context.mounted) {
                                  _showSuccessAddStoreList(context, ref);
                                  final UserState userState = ref.read(
                                    userViewModelProvider,
                                  );
                                  await userStoreListViewModel
                                      .getUserStoreListAll(
                                        userUuid: userState.data.userUuid,
                                      );
                                }
                              },
                              svg: Assets.icon.system.addCircleLine,
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (userStoreListState.userStoreLists.isEmpty)
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
                              onPressed: () async {
                                final Object? result = await context.pushNamed(
                                  AppRoutes.addUserStoreList.name,
                                );

                                if (result == true && context.mounted) {
                                  _showSuccessAddStoreList(context, ref);
                                  final UserState userState = ref.read(
                                    userViewModelProvider,
                                  );
                                  await userStoreListViewModel
                                      .getUserStoreListAll(
                                        userUuid: userState.data.userUuid,
                                      );
                                }
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
                            userStoreListState.userStoreLists[index];

                        final ({bool isOptionMenuVisible, int listId})
                        userStoreListOptionVisible = userStoreListState
                            .userStoreListOptionMenuVisible
                            .firstWhere(
                              (({bool isOptionMenuVisible, int listId}) e) =>
                                  e.listId == userStoreList.listId,
                            );
                        return Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: CustomSavedStoreListItem.withOptionMenus(
                                leftIconColor:
                                    StoreListIconColor.values
                                        .firstWhere(
                                          (StoreListIconColor e) =>
                                              e.id == userStoreList.iconColorId,
                                        )
                                        .color,
                                name: userStoreList.listName,
                                storeLength:
                                    userStoreList.storeData?.length ?? 0,

                                optionMenus: <CustomOptionMenu>[
                                  CustomOptionMenu(
                                    svg: Assets.icon.editor.pencil1Line,
                                    text: '수정하기',
                                    onTap: () async {
                                      userStoreListViewModel
                                          .invisibleAllOptionMenu();
                                      final Object?
                                      result = await context.pushNamed(
                                        AppRoutes.updateUserStoreList.name,
                                        pathParameters: <String, String>{
                                          'listId':
                                              userStoreList.listId.toString(),
                                        },
                                        queryParameters: <String, String>{
                                          'listName': userStoreList.listName,
                                          'iconColorId':
                                              userStoreList.iconColorId
                                                  .toString(),
                                        },
                                      );

                                      if (result == true) {
                                        final UserState userState = ref.read(
                                          userViewModelProvider,
                                        );
                                        await userStoreListViewModel
                                            .getUserStoreListAll(
                                              userUuid: userState.data.userUuid,
                                            );
                                      }
                                    },
                                  ),
                                  CustomOptionMenu(
                                    svg: Assets.icon.system.closeCircleLine,
                                    text: '삭제하기',
                                    onTap: () {
                                      userStoreListViewModel
                                          .invisibleAllOptionMenu();
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return CustomDialog.basic(
                                            title: '리스트를 삭제하시겠어요?',
                                            description:
                                                '삭제한 리스트의 가게는 더이상\n지도에 표시되지않습니다.',
                                            primaryButton: CustomDialogButton(
                                              text: '삭제하기',
                                              warning: true,
                                              onTap: () {
                                                viewmodel.deleteUserStoreList(
                                                  listId: userStoreList.listId,
                                                );
                                                context.pop();
                                              },
                                            ),
                                            secondaryButton: CustomDialogButton(
                                              text: '취소',
                                              onTap: () {
                                                context.pop();
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                                optionMenusVisible:
                                    userStoreListOptionVisible
                                        .isOptionMenuVisible,
                                onOptionMenusTap: () {
                                  userStoreListViewModel
                                      .updateStoreListOptionMenuVisible(
                                        listId:
                                            userStoreListOptionVisible.listId,
                                        isVisible: true,
                                      );
                                },
                                onTap: () {
                                  context.pushNamed(
                                    AppRoutes.storesByUserStoreList.name,
                                    pathParameters: <String, String>{
                                      'listId': userStoreList.listId.toString(),
                                    },
                                    queryParameters: <String, String>{
                                      'listName': userStoreList.listName,
                                    },
                                  );
                                },
                              ),
                            ),
                            Divider(
                              color: colorScheme.outlineVariant,
                              height: 1,
                            ),
                          ],
                        );
                      }, childCount: userStoreListState.userStoreLists.length),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSuccessAddStoreList(BuildContext context, WidgetRef ref) {
    final ToastManager toastManager = ref.read(toastManagerProvider);
    toastManager.show(
      context: context,
      toastWidget: CustomSnackBar(
        description: '새 리스트 추가를 완료했습니다',
        actionButton: SnackBarActionButton(
          onTap: () {
            toastManager.remove();
          },
          label: '닫기',
        ),
      ),
    );
  }
}
