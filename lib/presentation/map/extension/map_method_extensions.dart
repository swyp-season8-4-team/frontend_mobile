part of '../map_view.dart';

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

  Future<void> _getShopWithCurrentLocation() async {
    try {
      final Position positon =
          await ref.read(geoLocationManagerProvider).getCurrentPosition();

      final ({double lat, double lng, double radius}) queryOption =
          await NaverMapUtil.getLocationInfo(controller: _mapController);

      ref
          .read(mapViewModelProvider.notifier)
          .getStoresByCameraPosition(
            lat: positon.latitude,
            lng: positon.longitude,
            radius: queryOption.radius,
          );
    } catch (e) {
      final ({double lat, double lng, double radius}) queryOption =
          await NaverMapUtil.getLocationInfo(controller: _mapController);

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
    )..setOnTapListener((NMarker overlay) async {
      final MapState state = ref.read(mapViewModelProvider);

      if (state.getStoreSummaryStatus.isLoading) {
        return;
      }

      final MapViewModel viewmodel = ref.read(mapViewModelProvider.notifier);

      // 이전에 선택된 마커가 있다면 초기화
      await _clearSelectedShop();

      // 선택한 마커에 해당하는 가게 간략 정보 조회
      //ignore: unawaited_futures
      viewmodel.getStoreSummary(overlay: overlay);

      await NaverMapUtil.moveCameraToLocation(
        controller: _mapController,
        lat: overlay.position.latitude,
        lng: overlay.position.longitude,
      );

      //ignore: unawaited_futures
      _showStoreSummary(storeUuid: overlay.info.id);
    });
  }

  Future<void> _clearSelectedShop() async {
    final MapState state = ref.read(mapViewModelProvider);

    if (state.selectedMarker != null) {
      await _mapController.deleteOverlay(
        NOverlayInfo(
          type: NOverlayType.marker,
          id: state.selectedMarker!.info.id,
        ),
      );

      final StoreByLocationModel? storeByLocation = state.storesByLocation
          .firstWhereOrNull(
            (StoreByLocationModel e) =>
                e.storeUuid == state.selectedMarker!.info.id,
          );

      if (storeByLocation != null) {
        await _mapController.addOverlay(
          await _storeToMarker(model: storeByLocation),
        );
      }
    }
  }
}
