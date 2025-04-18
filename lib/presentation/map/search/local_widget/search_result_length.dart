part of '../search_store_view.dart';

class _SearchResultLength extends ConsumerWidget {
  const _SearchResultLength();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SearchStoreState state = ref.watch(searchStoreViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: ScaleColorConfig.neutral90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: <Widget>[
                Text(
                  '총',
                  style: textTheme.labelLarge?.copyWith(
                    color: const Color(0xFF393939),
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  '${state.stores.length > 200 ? '200+' : state.stores.length}',
                  style: textTheme.labelLarge?.copyWith(
                    color: ScaleColorConfig.success50,
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  '건',
                  style: textTheme.labelLarge?.copyWith(
                    color: const Color(0xFF393939),
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 1, height: 1, color: colorScheme.outlineVariant),
        ],
      ),
    );
  }
}
