part of 'map_view.dart';

// ignore: library_private_types_in_public_api
extension MapViewExt on _MapViewState {
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
      widget: CustomDefaultMarker(text: model.name),
      size: const Size(108, 70),
      context: context,
    );

    return NMarker(
      id: model.storeUuid,
      icon: markerImage,
      anchor: const NPoint(0.5, 0.5),
      position: NLatLng(model.latitude, model.longitude),
    );
  }
}
