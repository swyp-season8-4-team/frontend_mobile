part of '../my_page_view.dart';

class _CustomerSupport extends ConsumerWidget {
  const _CustomerSupport();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: _MenuList(
        title: '고객 지원',
        menus: <_MenuType>[
          _MenuType(
            label: '약관 및 정책',
            onTap: () {
              context.pushNamed(AppRoutes.myPolicy.name);
            },
          ),
        ],
      ),
    );
  }
}

// 메뉴 종류
class _MenuType {
  const _MenuType({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;
}

// 메뉴 리스트
class _MenuList extends StatelessWidget {
  const _MenuList({required this.title, required this.menus});
  final String title;
  final List<_MenuType> menus;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
        color: ScaleColorConfig.neutral100,
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: ScaleColorConfig.surface80,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              title,
              style: textTheme.titleSmall?.copyWith(
                color: ScaleColorConfig.primary20,
              ),
            ),
          ),
          ...menus.map(
            (_MenuType e) => GestureDetector(
              onTap: e.onTap,
              behavior: HitTestBehavior.translucent,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: colorScheme.outlineVariant),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        e.label,
                        style: textTheme.bodySmall?.copyWith(
                          color: ScaleColorConfig.primary20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Assets.icon.arrow.rightLine.svg(
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                        ScaleColorConfig.neutral40,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
