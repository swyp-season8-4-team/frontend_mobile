part of '../update_profile_info_view.dart';

class _Preferences extends ConsumerWidget {
  const _Preferences();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UpdateProfileInfoState state = ref.watch(
      updateProfileInfoViewModelProvider,
    );
    final PreferenceState preferences = ref.watch(preferenceViewModelProvider);

    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  '내 디저트 취향',
                  style: textTheme.titleSmall?.copyWith(
                    color: ScaleColorConfig.primary20,
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: state.userPreferences.length.toString(),
                      style: textTheme.labelLarge?.copyWith(
                        color: ScaleColorConfig.success50,
                      ),
                    ),
                    TextSpan(
                      text: '개 선택',
                      style: textTheme.labelLarge?.copyWith(
                        color: ScaleColorConfig.neutral30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, color: colorScheme.outline),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _PreferenceFilters(
                title: '식단&건강',
                preferences: preferences.data.sublist(0, 5),
              ),
              const SizedBox(height: 24),
              _PreferenceFilters(
                title: '트렌드&감성',
                preferences: preferences.data.sublist(5, 8),
              ),
              const SizedBox(height: 24),
              _PreferenceFilters(
                title: '경험&독창성',
                preferences: preferences.data.sublist(8),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// 유저 취향 필터 리스트
class _PreferenceFilters extends ConsumerWidget {
  const _PreferenceFilters({required this.preferences, required this.title});
  final String title;
  final List<PreferenceModel> preferences;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final UpdateProfileInfoState state = ref.watch(
      updateProfileInfoViewModelProvider,
    );
    final UpdateProfileInfoViewModel viewmodel = ref.read(
      updateProfileInfoViewModelProvider.notifier,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: textTheme.labelLarge?.copyWith(
            color: ScaleColorConfig.neutral40,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          runSpacing: 6,
          spacing: 6,
          children: <Widget>[
            ...preferences.map(
              (PreferenceModel e) => CustomSuggestiveChip(
                label: e.preferenceName,
                onPressed: () {
                  viewmodel.updateUserPreferences(preferenceTagId: e.id);
                },
                isSelected: state.userPreferences.contains(e.id),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
