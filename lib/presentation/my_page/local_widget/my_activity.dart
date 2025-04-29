part of '../my_page_view.dart';

class _MyActivity extends ConsumerWidget {
  const _MyActivity();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final UserStoreListState userStoreListState = ref.watch(
      userStoreListViewModelProvider,
    );
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              '내 활동',
              style: textTheme.titleSmall?.copyWith(
                color: ScaleColorConfig.primary20,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: _MyActivityMenu(
                  png: Assets.image.bookmark,
                  label: '찜한 가게',
                  count: userStoreListState.storeAllCount,
                  onTap: () {
                    context.pushNamed(AppRoutes.myUserStoreList.name);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 내 활동 메뉴 버튼 UI
class _MyActivityMenu extends StatelessWidget {
  const _MyActivityMenu({
    required this.png,
    required this.label,
    required this.count,
    required this.onTap,
  });
  final AssetGenImage png;
  final String label;
  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: colorScheme.outlineVariant),
          color: ScaleColorConfig.neutral100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: <Widget>[
            SizedBox.square(
              dimension: 24,
              child: png.image(width: 20, height: 20, fit: BoxFit.cover),
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: textTheme.labelLarge?.copyWith(
                color: ScaleColorConfig.neutral20,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                '$count',
                style: textTheme.labelLarge?.copyWith(
                  color: ScaleColorConfig.success50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
