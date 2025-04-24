part of '../stores_by_user_store_list_view.dart';

class _StoreList extends ConsumerWidget {
  const _StoreList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StoresByUserStoreListState state = ref.watch(
      storesByUserStoreListViewModelProvider,
    );

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          final UserStoreDetailModel store = state.storeList!.storeData![index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                // FIXME: 지도를 통해 간략하게 조회한 후 상세 조회 페이지로 이동할 수 있어야함
                context.pushNamed(
                  AppRoutes.storeDetail.name,
                  pathParameters: <String, String>{'id': store.storeUuid},
                );
              },
              child: _StoreCard(store: store),
            ),
          );
        }, childCount: state.storeList!.storeData!.length),
      ),
    );
  }
}
