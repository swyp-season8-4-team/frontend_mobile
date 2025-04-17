part of '../store_detail_view.dart';

class _Menus extends ConsumerWidget {
  const _Menus();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StoreDetailState state = ref.watch(storeDetailViewModelProvider);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final StoreDetailMenuModel menu = state.storeDetail!.menus[index];
        return _Menu(menu: menu);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          thickness: 1,
          height: 1,
          color: colorScheme.outlineVariant,
        );
      },
      itemCount: state.storeDetail!.menus.length,
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({required this.menu});
  final StoreDetailMenuModel menu;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final NumberFormat formatCurrency = NumberFormat.simpleCurrency(
      locale: 'ko_KR',
      name: '',
      decimalDigits: 0,
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: 100,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  menu.name,
                  style: textTheme.titleSmall?.copyWith(
                    color: ScaleColorConfig.neutral20,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(width: 6),
                Text(
                  menu.description ?? '',
                  style: textTheme.bodySmall?.copyWith(
                    color: ScaleColorConfig.neutral30,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                const Spacer(),
                Text(
                  '${formatCurrency.format(menu.price)} 원',
                  style: textTheme.labelLarge?.copyWith(
                    color: ScaleColorConfig.neutral20,
                  ),
                ),
              ],
            ),
          ),
          if (menu.images != null && menu.images!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: CachedNetworkImage(
                imageUrl: menu.images![0],
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}
