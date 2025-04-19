part of '../search_store_view.dart';

class _SearchResult extends ConsumerWidget {
  const _SearchResult();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SearchStoreState state = ref.watch(searchStoreViewModelProvider);
    final List<StoreByLocationModel> stores = state.stores;
    final SearchStoreViewModel viewmodel = ref.read(
      searchStoreViewModelProvider.notifier,
    );

    if (state.getStoresStatus.isFailure) {
      return SliverToBoxAdapter(
        child: _Failure(
          onRetryTap: () {
            viewmodel.getStores();
          },
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        final StoreByLocationModel store = stores[index];
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            context.pushNamed(
              AppRoutes.storeDetail.name,
              pathParameters: <String, String>{'id': store.storeUuid},
            );
          },
          child: _StoreCard(store: store),
        );
      }, childCount: stores.length),
    );
  }
}
