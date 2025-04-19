part of '../stores_by_user_store_list_view.dart';

//ignore: unused_element
class _StoreCard extends ConsumerWidget {
  const _StoreCard({required this.store});
  final UserStoreModel store;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final StoresByUserStoreListState state = ref.watch(
      storesByUserStoreListViewModelProvider,
    );

    final StoresByUserStoreListViewModel viewmodel = ref.read(
      storesByUserStoreListViewModelProvider.notifier,
    );

    final ({bool isOptionMenuVisible, String storeUuid})
    storeOptionMenuVisible = state.storeOptionMenuVisibleList.firstWhere(
      (({bool isOptionMenuVisible, String storeUuid}) e) =>
          e.storeUuid == store.storeUuid,
    );

    final List<PreferenceModel> allPreferences = state.preferences;

    final List<PreferenceModel> storePreferences =
        store.userPreferences == null
            ? <PreferenceModel>[]
            : allPreferences
                .where(
                  (PreferenceModel e) => store.userPreferences!.contains(e.id),
                )
                .toList();

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5.71),
            child: CachedNetworkImage(
              imageUrl:
                  store.imageUrls == null || store.imageUrls!.isEmpty
                      ? ''
                      : store.imageUrls!.first,
              errorWidget: (_, _, _) {
                // TODO: 적절한 에러 위젯 필요
                return const SizedBox();
              },
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        store.storeName,
                        style: textTheme.titleSmall?.copyWith(
                          // TODO: 컬러 적용 필요
                          color: const Color(0xFF393939),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 6),
                    PortalTarget(
                      // 표출될 드롭다운 위젯 지정
                      portalFollower: Padding(
                        padding: const EdgeInsets.only(top: 4, right: 4),
                        child: CustomOptionMenuDropdown(
                          optionMenus: <CustomOptionMenu>[
                            // TODO: 추후 추가 예정
                            // CustomOptionMenu(
                            //   svg: Assets.icon.editor.pencil1Line,
                            //   text: '수정하기',
                            //   onTap: () {},
                            // ),
                            CustomOptionMenu(
                              svg: Assets.icon.system.closeCircleLine,
                              text: '삭제하기',
                              onTap: () {
                                viewmodel.invisibleAllStoreOptionMenu();

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomDialog.basic(
                                      title: '가게 저장을 삭제하시겠어요?',
                                      description:
                                          '저장 삭제한 가게는 더이상\n리스트에 표시되지않습니다.',
                                      primaryButton: CustomDialogButton(
                                        text: '삭제하기',
                                        warning: true,
                                        onTap: () {
                                          viewmodel.deleteStore(
                                            listId: store.listId,
                                            storeUuid: store.storeUuid,
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
                        ),
                      ),
                      anchor: const Aligned(
                        follower: Alignment.topRight,
                        target: Alignment.bottomRight,
                      ),
                      visible: storeOptionMenuVisible.isOptionMenuVisible,
                      child: GestureDetector(
                        onTap: () {
                          viewmodel.updateStoreOptionMenuVisible(
                            storeUuid: store.storeUuid,
                            isVisible:
                                !storeOptionMenuVisible.isOptionMenuVisible,
                          );
                        },
                        child: Assets.icon.menu.more2Fill.svg(
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                            ScaleColorConfig.neutral50,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: <Widget>[
                    Assets.icon.map.a14x14AddressLine.svg(
                      colorFilter: const ColorFilter.mode(
                        ScaleColorConfig.neutral40,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        store.storeAddress,
                        style: textTheme.bodySmall?.copyWith(
                          color: ScaleColorConfig.neutral40,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  storePreferences
                      .map((PreferenceModel e) => e.preferenceName)
                      .join(' | '),
                  style: textTheme.bodySmall?.copyWith(
                    // TODO: 컬러 적용 필요
                    color: const Color(0xFF6F6F6F),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
