part of 'map_view.dart';

// ignore: library_private_types_in_public_api
extension MapViewMethodExt on _MapViewState {
  Future<void> _goToCurrentLocation() async {
    try {
      final Position result =
          await ref.read(geoLocationManagerProvider).getCurrentPosition();

      await _mapController.updateCamera(
        NCameraUpdate.fromCameraPosition(
          NCameraPosition(
            target: NLatLng(result.latitude, result.longitude),
            zoom: _zoom,
          ),
        ),
      );

      // 위치 권한이 허용된 이후
      // 트래킹할 수 있도록 설정
      await _mapController.setLocationTrackingMode(
        NLocationTrackingMode.noFollow,
      );

      // 현재 위치에서 가게를 조회.
      await _getShopWithCurrentLocation();
    } catch (e) {
      return;
    }
  }

  Future<void> _setCustomLocationOverlay() async {
    if (mounted) {
      final NLocationOverlay locationOverlay =
          _mapController.getLocationOverlay();

      // NOverlayImage.fromAssetImage는 svg를 지원하지 않음
      const NOverlayImage locationOverlayImage = NOverlayImage.fromAssetImage(
        'asset/image/current_location.png',
      );

      locationOverlay
        ..setIcon(locationOverlayImage)
        ..setIconSize(const Size.square(50))
        ..setCircleColor(Colors.transparent)
        ..setIsVisible(false)
        ..setIsVisible(true);
    }
  }

  Future<({double lat, double lng, double radius})> _getQueryOption() async {
    // 위도 1도의 거리
    const double killometerPerLatitude = 6400 * 2 * pi / 360;

    final NCameraPosition nCameraPosition =
        await _mapController.getCameraPosition();

    final NLatLngBounds latLngBounds = await _mapController.getContentBounds();

    final double latRadius =
        latLngBounds.northLatitude - nCameraPosition.target.latitude;

    // 위도 간 거리 (킬로미터 단위)
    final double latDistance = latRadius * killometerPerLatitude;

    final double lngRadius =
        latLngBounds.eastLongitude - nCameraPosition.target.longitude;
    final double latitudeInRadian = nCameraPosition.target.latitude * pi / 180;

    // 경도 간 거리 (킬로미터 단위)
    final double lngDistance =
        lngRadius * cos(latitudeInRadian) * killometerPerLatitude;

    final double radiusDistance = min(latDistance, lngDistance);

    return (
      lat: nCameraPosition.target.latitude,
      lng: nCameraPosition.target.longitude,
      radius: radiusDistance,
    );
  }

  Future<void> _getShopWithCurrentLocation() async {
    try {
      final Position positon =
          await ref.read(geoLocationManagerProvider).getCurrentPosition();

      final ({double lat, double lng, double radius}) queryOption =
          await _getQueryOption();

      ref
          .read(mapViewModelProvider.notifier)
          .getStoresByCameraPosition(
            lat: positon.latitude,
            lng: positon.longitude,
            radius: queryOption.radius,
          );
    } catch (e) {
      final ({double lat, double lng, double radius}) queryOption =
          await _getQueryOption();

      ref
          .read(mapViewModelProvider.notifier)
          .getStoresByCameraPosition(
            lat: queryOption.lat,
            lng: queryOption.lng,
            radius: queryOption.radius,
          );
    }
  }

  Future<NMarker> _storeToMarker({required StoreByLocationModel model}) async {
    final NOverlayImage markerImage = await NOverlayImage.fromWidget(
      widget: Align(child: CustomDefaultMarker(text: model.name)),
      size: const Size(108, 75),
      context: context,
    );

    return NMarker(
      id: model.storeUuid,
      icon: markerImage,
      position: NLatLng(model.latitude, model.longitude),
    );
  }
}

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
                      await _getQueryOption();

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
                    selected: state.preferenceTagIds.contains(e.id),
                    onPressed: () async {
                      final ({double lat, double lng, double radius})
                      queryOption = await _getQueryOption();
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
            state.preferenceTagIds.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CustomMapIconButton.filterReset(
              onPressed: () async {
                final ({double lat, double lng, double radius}) queryOption =
                    await _getQueryOption();
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

  Widget _buildRefreshButton() {
    final MapViewModel viewmodel = ref.read(mapViewModelProvider.notifier);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () async {
          final ({double lat, double lng, double radius}) queryOption =
              await _getQueryOption();
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
}
