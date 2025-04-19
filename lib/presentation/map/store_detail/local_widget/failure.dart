part of '../store_detail_view.dart';

class _Failure extends ConsumerWidget {
  const _Failure({required this.storeUuid});
  final String storeUuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StoreDetailViewModel viewmodel = ref.read(
      storeDetailViewModelProvider.notifier,
    );

    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const CustomSubTopBar(title: '', actions: <Widget>[]),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 223),
            Assets.icon.system.warningFill.svg(
              width: 42.8,
              height: 42.8,
              colorFilter: const ColorFilter.mode(
                ScaleColorConfig.primary80,
                BlendMode.srcIn,
              ),
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
              label: '다시 시도',
              width: 126,
              onPressed: () {
                viewmodel.getStoreDetail(storeUuid: storeUuid);
              },
              isSelected: false,
            ),
          ],
        ),
      ),
    );
  }
}
