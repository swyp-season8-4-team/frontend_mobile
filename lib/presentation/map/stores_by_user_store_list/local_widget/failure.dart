part of '../stores_by_user_store_list_view.dart';

class _Failure extends ConsumerWidget {
  const _Failure({required this.listId});
  final int listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserStoreListModel storeList = ref
        .watch(mapViewModelProvider)
        .userStores
        .firstWhere((UserStoreListModel e) => e.listId == listId);

    final StoresByUserStoreListViewModel viewmodel = ref.read(
      storesByUserStoreListViewModelProvider.notifier,
    );

    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomSubTopBar(
        title: storeList.listName,
        actions: const <Widget>[],
        primary: false,
      ),
      body: Padding(
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
                  viewmodel.getPreferences();
                  viewmodel.getStores(listId: listId);
                },
                isSelected: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
