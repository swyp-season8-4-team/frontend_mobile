part of '../map_view.dart';

// ignore: library_private_types_in_public_api
extension MapViewWidgetExt on _MapViewState {
  // 상단 필터
  Widget _buildFilterList() {
    final MapState state = ref.watch(mapViewModelProvider);
    final MapViewModel viewmodel = ref.read(mapViewModelProvider.notifier);
    return SizedBox(
      height: 28,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[
              CustomFloatingChip(
                label: '내 취향',
                selected: state.myPreferenceFilterSelected,
                onPressed: () async {
                  final ({double lat, double lng, double radius}) queryOption =
                      await NaverMapUtil.getLocationInfo(
                        controller: _mapController,
                      );

                  viewmodel.updateMyPreferenceFilter(
                    lat: queryOption.lat,
                    lng: queryOption.lng,
                    radius: queryOption.radius,
                  );
                },
              ),
              ...state.preferences.mapIndexed(
                (int index, PreferenceModel e) => Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: CustomFloatingChip(
                    label: e.preferenceName,
                    selected: state.preferenceTagIds?.contains(e.id) == true,
                    onPressed: () async {
                      final ({double lat, double lng, double radius})
                      queryOption = await NaverMapUtil.getLocationInfo(
                        controller: _mapController,
                      );
                      viewmodel.updatePreferenceFilter(
                        lat: queryOption.lat,
                        lng: queryOption.lng,
                        radius: queryOption.radius,
                        preference: e,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 우측 버튼
  Widget _buildControlButtons() {
    final MapState state = ref.watch(mapViewModelProvider);
    final MapViewModel viewmodel = ref.read(mapViewModelProvider.notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (!state.myPreferenceFilterSelected &&
            state.preferenceTagIds?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CustomMapIconButton.filterReset(
              onPressed: () async {
                final ({double lat, double lng, double radius}) queryOption =
                    await NaverMapUtil.getLocationInfo(
                      controller: _mapController,
                    );
                viewmodel.clearAllFilter(
                  lng: queryOption.lng,
                  lat: queryOption.lat,
                  radius: queryOption.lng,
                );
              },
            ),
          ),
        CustomMapIconButton.saveStore(isSelected: true, onPressed: () {}),
        const SizedBox(height: 10),
        CustomMapIconButton.myLocation(
          isSelected: false,
          onPressed: () {
            _goToCurrentLocation();
          },
        ),
      ],
    );
  }

  // 하단 중앙 새로고침 버튼
  Widget _buildRefreshButton() {
    final MapViewModel viewmodel = ref.read(mapViewModelProvider.notifier);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final double bottmNavigationBarHeight =
        MediaQuery.of(context).padding.bottom + 80;

    return Padding(
      padding: EdgeInsets.only(bottom: 16 + bottmNavigationBarHeight),
      child: GestureDetector(
        onTap: () async {
          final ({double lat, double lng, double radius}) queryOption =
              await NaverMapUtil.getLocationInfo(controller: _mapController);
          viewmodel.getStoresByCameraPosition(
            lat: queryOption.lat,
            lng: queryOption.lng,
            radius: queryOption.radius,
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: colorScheme.outline),
            boxShadow: ShadowConfig().level1,
            borderRadius: BorderRadius.circular(99),
            color: ScaleColorConfig.primary100,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Assets.icon.system.refresh1Line.svg(
                width: 18,
                height: 18,
                colorFilter: const ColorFilter.mode(
                  ScaleColorConfig.success50,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '현 위치에서 새로고침',
                style: textTheme.labelLarge?.copyWith(
                  color: ScaleColorConfig.success50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 가게 간략 정보를 표시하기 위한 바텀시트 표출
  Future<void> _showStoreSummary({required String storeUuid}) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: ScaleColorConfig.white,
      barrierColor: Colors.transparent,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (BuildContext context) {
        return Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final MapState state = ref.watch(mapViewModelProvider);

            return CustomStoreInfoBottomSheetContent(
              storeSummary: state.storeSummary,
              isLoading:
                  state.getStoreSummaryStatus.isLoading ||
                  state.getStoreSummaryStatus.isInitial,
              isFailure: state.getStoreSummaryStatus.isFailure,
              onRefreshTap: () {
                ref
                    .read(mapViewModelProvider.notifier)
                    .getStoreSummary(
                      overlay: ref.read(mapViewModelProvider).selectedMarker!,
                    );
              },
            );
          },
        );
      },
    );
    await _clearSelectedShop();
  }
}
