part of '../update_profile_info_view.dart';

class _SaveButton extends ConsumerWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UpdateProfileInfoState state = ref.watch(
      updateProfileInfoViewModelProvider,
    );
    final UpdateProfileInfoViewModel viewmodel = ref.read(
      updateProfileInfoViewModelProvider.notifier,
    );

    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colorScheme.outline)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: CustomFillButton.medium(
        label: '저장',
        disabled:
            !state.postNicknameStatus.isSuccess ||
            !state.nicknameAvailabilityData.available,
        onPressed: () {
          viewmodel.updateProfileInfo();
        },
      ),
    );
  }
}
