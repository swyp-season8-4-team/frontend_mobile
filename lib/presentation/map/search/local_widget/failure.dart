part of '../search_store_view.dart';

class _Failure extends ConsumerWidget {
  const _Failure({required this.onRetryTap});
  final VoidCallback onRetryTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
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
              onPressed: onRetryTap,
              isSelected: false,
            ),
          ],
        ),
      ),
    );
  }
}
