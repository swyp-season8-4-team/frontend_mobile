part of '../store_detail_view.dart';

class _RecentNotice extends ConsumerWidget {
  const _RecentNotice();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StoreDetailState state = ref.watch(storeDetailViewModelProvider);
    final StoreDetailModel storeDetail = state.storeDetail!;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final bool hasNotice =
        storeDetail.notices != null && storeDetail.notices!.isNotEmpty;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colorScheme.outlineVariant)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                '📣 최근 공지',
                style: textTheme.titleSmall?.copyWith(
                  color: ScaleColorConfig.primary20,
                ),
              ),
              const Spacer(),
              CustomOutlineButton.xSmall(label: '모든 공지', onPressed: () {}),
            ],
          ),
          const SizedBox(height: 12),
          CustomExpandableText(
            text:
                hasNotice
                    ? '${storeDetail.notices!.first.title}\n${storeDetail.notices!.first.content}'
                    : '등록된 공지가 없습니다.',
            dateTime: storeDetail.notices!.first.createdAt,
          ),
        ],
      ),
    );
  }
}
