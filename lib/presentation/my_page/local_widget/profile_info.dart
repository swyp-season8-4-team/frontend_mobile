part of '../my_page_view.dart';

class _ProfileInfo extends ConsumerStatefulWidget {
  const _ProfileInfo({
    required this.isTagExpanded,
    required this.onTagExpandedTap,
  });

  final bool isTagExpanded;
  final VoidCallback onTagExpandedTap;

  @override
  ConsumerState<_ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends ConsumerState<_ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final UserState userState = ref.watch(userViewModelProvider);
    final PreferenceState preferences = ref.watch(preferenceViewModelProvider);

    // 유저의 취향
    final List<PreferenceModel> userPreferences =
        preferences.data
            .where(
              (PreferenceModel e) => userState.data.preferences.contains(e.id),
            )
            .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 76 + 31,
              color: ScaleColorConfig.neutral100,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Assets.image.profileBg.image(
                    height: 76,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      final Object? result = await context.pushNamed(
                        AppRoutes.updateProfileInfo.name,
                      );

                      if (result == true) {
                        _showSuccessUpdateProfileInfo();
                      }
                    },
                    child:
                        userState.isMale
                            ? CustomProfilePhotoEdit.boy(
                              imageUrl: userState.data.profileImageUrl,
                            )
                            : CustomProfilePhotoEdit.girl(
                              imageUrl: userState.data.profileImageUrl,
                            ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: ScaleColorConfig.neutral100,
            border: Border(
              bottom: BorderSide(color: colorScheme.outlineVariant),
            ),
          ),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Text(
                userState.data.nickname,
                style: textTheme.titleSmall?.copyWith(
                  color: const Color(0xFF393939),
                ),
              ),
              const SizedBox(height: 10),
              if (userPreferences.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                  child: Center(
                    child: Wrap(
                      runSpacing: 6,
                      children: <Widget>[
                        if (userPreferences.length > 5) ...<Widget>[
                          ...List<Widget>.generate(
                            widget.isTagExpanded ? userPreferences.length : 5,
                            (int index) {
                              final PreferenceModel userPreference =
                                  userPreferences[index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: CustomLabelTag(
                                  label: userPreference.preferenceName,
                                  backgroundColor: ScaleColorConfig.neutral70,
                                  color: ScaleColorConfig.neutral30,
                                ),
                              );
                            },
                          ),
                          _ViewMoreTag(
                            label:
                                widget.isTagExpanded
                                    ? '접기'
                                    : '+${userPreferences.length - 5}',

                            onTap: widget.onTagExpandedTap,
                          ),
                        ] else
                          ...userPreferences.mapIndexed(
                            (int index, PreferenceModel e) => Padding(
                              padding: EdgeInsets.only(
                                right:
                                    index == userPreferences.length - 1 ? 0 : 6,
                              ),
                              child: CustomLabelTag(
                                label: e.preferenceName,
                                backgroundColor: ScaleColorConfig.neutral70,
                                color: ScaleColorConfig.neutral30,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  void _showSuccessUpdateProfileInfo() {
    final ToastManager toastManager = ref.read(toastManagerProvider);
    toastManager.show(
      context: context,
      aboveBottomNavigation: true,
      toastWidget: CustomSnackBar(
        description: '새 프로필이 저장되었습니다',
        actionButton: SnackBarActionButton(
          onTap: () {
            toastManager.remove();
          },
          label: '닫기',
        ),
      ),
    );
  }
}

// 취향 태그 더보기 버튼
class _ViewMoreTag extends StatelessWidget {
  const _ViewMoreTag({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          border: Border.all(color: colorScheme.outline),
          color: ScaleColorConfig.neutral100,
        ),
        child: Text(
          label,
          style: textTheme.labelSmall?.copyWith(
            color: ScaleColorConfig.neutral20,
          ),
        ),
      ),
    );
  }
}
