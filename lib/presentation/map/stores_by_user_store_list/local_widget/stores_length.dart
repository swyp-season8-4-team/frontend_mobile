part of '../stores_by_user_store_list_view.dart';

class _StoresLength extends ConsumerWidget {
  const _StoresLength();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StoresByUserStoreListState state = ref.watch(
      storesByUserStoreListViewModelProvider,
    );
    return SliverPinnedToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
        color: ScaleColorConfig.neutral90,
        child: Row(
          children: <Widget>[
            // TODO: 타이포그래피 적용 필요
            const Text(
              '전체',
              style: TextStyle(
                color: Color(0xFF393939),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.30,
                letterSpacing: -0.21,
              ),
            ),
            const SizedBox(width: 5),

            // TODO: 타이포그래피 적용 필요
            Text(
              '${state.storeList?.storeData?.length ?? 0}',
              style: const TextStyle(
                color: ScaleColorConfig.success50,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.30,
                letterSpacing: -0.21,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
