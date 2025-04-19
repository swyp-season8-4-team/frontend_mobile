part of '../store_detail_view.dart';

class _Introduce extends ConsumerWidget {
  const _Introduce();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StoreDetailState state = ref.watch(storeDetailViewModelProvider);
    final StoreDetailModel storeDetail = state.storeDetail!;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colorScheme.outlineVariant)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '📌 한 줄 소개',
            style: textTheme.titleSmall?.copyWith(
              color: ScaleColorConfig.primary20,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.outline),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                  child: Text(
                    storeDetail.description ?? '',
                    style: textTheme.bodySmall?.copyWith(
                      color: ScaleColorConfig.neutral10,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  child: Text(
                    DateFormat('yyyy.MM.dd').format(
                      storeDetail.descriptionUpdateTime ?? DateTime.now(),
                    ),
                    style: textTheme.labelSmall?.copyWith(
                      color: ScaleColorConfig.neutral40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
