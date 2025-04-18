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
              imageUrl: store.imageUrls?.first ?? '',
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
                    GestureDetector(
                      onTap: () {},
                      behavior: HitTestBehavior.translucent,
                      child: Assets.icon.menu.more2Fill.svg(
                        width: 20,
                        height: 20,
                        colorFilter: const ColorFilter.mode(
                          ScaleColorConfig.neutral50,
                          BlendMode.srcIn,
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
