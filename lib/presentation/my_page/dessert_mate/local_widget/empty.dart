part of '../my_dessert_mate_view.dart';

class _Empty extends StatelessWidget {
  const _Empty();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 219),
          Text(
            '아직 디저트 메이트 모임이 없어요!',
            style: textTheme.titleSmall?.copyWith(
              color: ScaleColorConfig.neutral20,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '나와 행복한 시간을 나눌 친구들을\n찾으러 떠나는 건 어떠세요?',
            style: textTheme.bodySmall?.copyWith(
              color: ScaleColorConfig.neutral40,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 18),
          _GoToDessertMateButton(
            label: '디저트 메이트 가기',
            onTap: () {
              context.goNamed(AppRoutes.dessertBoard.name);
            },
          ),
        ],
      ),
    );
  }
}

class _GoToDessertMateButton extends StatelessWidget {
  const _GoToDessertMateButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: ScaleColorConfig.primary100,
          border: Border.all(color: colorScheme.outline),
          borderRadius: BorderRadius.circular(99),
        ),
        child: Text(
          label,
          style: textTheme.titleSmall?.copyWith(
            color: ScaleColorConfig.neutral20,
          ),
        ),
      ),
    );
  }
}
