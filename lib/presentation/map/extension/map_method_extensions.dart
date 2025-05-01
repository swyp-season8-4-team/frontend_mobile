part of '../map_view.dart';

// ignore: library_private_types_in_public_api
extension MapViewMethodExt on _MapViewState {
  Future<void> _goToCurrentLocation() async {
    try {
      final Position result =
          await ref.read(geoLocationManagerProvider).getCurrentPosition();

      await _mapController!.updateCamera(
        NCameraUpdate.fromCameraPosition(
          NCameraPosition(
            target: NLatLng(result.latitude, result.longitude),
            zoom: _zoom,
          ),
        ),
      );

      // 위치 권한이 허용된 이후
      // 트래킹할 수 있도록 설정
      await _mapController!.setLocationTrackingMode(
        NLocationTrackingMode.noFollow,
      );

      // 현재 위치에서 가게를 조회.
      await _getShopWithCurrentLocation();
    } catch (e) {
      // 현재 위치에서 가게를 조회.
      await _getShopWithCurrentLocation();
      return;
    }
  }

  Future<void> _getShopWithCurrentLocation() async {
    try {
      final Position positon =
          await ref.read(geoLocationManagerProvider).getCurrentPosition();

      final ({double lat, double lng, double radius}) queryOption =
          await NaverMapUtil.getLocationInfo(controller: _mapController!);

      ref
          .read(mapViewModelProvider.notifier)
          .getStoresByCameraPosition(
            lat: positon.latitude,
            lng: positon.longitude,
            radius: queryOption.radius,
          );
    } catch (e) {
      final ({double lat, double lng, double radius}) queryOption =
          await NaverMapUtil.getLocationInfo(controller: _mapController!);

      ref
          .read(mapViewModelProvider.notifier)
          .getStoresByCameraPosition(
            lat: queryOption.lat,
            lng: queryOption.lng,
            radius: queryOption.radius,
          );
    }
  }

  Future<NMarker> _storeToMarker({
    required String storeUuid,
    required String storeName,
    required double latitude,
    required double longitude,
    // 저장된 가게 여부
    required bool isSavedStore,

    // 저장 리스트 모드 활성화 여부
    required bool userStoreMode,
    int? listId,
    Color? backgroundColor,
  }) async {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final NOverlayImage markerImage = await NOverlayImage.fromWidget(
      widget: Align(child: CustomDefaultMarker(text: storeName)),
      size: const Size(108, 75),
      context: context,
    );

    NOverlayImage? savedMarkerImage;
    if (mounted) {
      savedMarkerImage = await NOverlayImage.fromWidget(
        widget: CustomSavedMarker(
          backgroundColor: backgroundColor ?? colorScheme.accentYellow,
        ),
        size: const Size(32, 32),
        context: context,
      );
    }

    // 저장된 가게면 -> Saved marker로 표시
    // 저장되지 않은 가게라면 -> Default marker로 표시
    return NMarker(
      id: storeUuid,
      icon: isSavedStore && userStoreMode ? savedMarkerImage : markerImage,
      position: NLatLng(latitude, longitude),
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
      viewmodel.getStoreSummary(overlay: overlay, listId: listId);

      await NaverMapUtil.moveCameraToLocation(
        controller: _mapController!,
        lat: overlay.position.latitude,
        lng: overlay.position.longitude,
      );

      //ignore: unawaited_futures
      _showStoreSummary(storeUuid: overlay.info.id, listId: listId);
    });
  }

  Future<void> _clearSelectedShop() async {
    final MapState state = ref.read(mapViewModelProvider);
    final UserStoreListState userStoreListState = ref.read(
      userStoreListViewModelProvider,
    );

    if (state.selectedMarker != null) {
      await _mapController!.deleteOverlay(
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

      final UserStoreListModel? savedStoreList = userStoreListState
          .userStoreLists
          .firstWhereOrNull(
            (UserStoreListModel e) => e.listId == state.selectedListId,
          );

      final UserStoreDataModel? savedStore = _findUserStoreModelByStoreUuid(
        userStoreListState.userStoreLists,
        state.selectedMarker!.info.id,
      );

      if (savedStore != null && state.userStoresEnabled) {
        await _mapController!.addOverlay(
          await _storeToMarker(
            storeUuid: savedStore.storeUuid,
            storeName: savedStore.name,
            latitude: savedStore.latitude,
            longitude: savedStore.longitude,
            isSavedStore: true,
            listId: state.selectedListId,
            backgroundColor:
                StoreListIconColor.values
                    .firstWhereOrNull(
                      (StoreListIconColor e) =>
                          e.id == savedStoreList?.iconColorId,
                    )
                    ?.color,
            userStoreMode: state.userStoresEnabled,
          ),
        );

        return;
      }

      if (storeByLocation != null) {
        await _mapController!.addOverlay(
          await _storeToMarker(
            storeUuid: storeByLocation.storeUuid,
            storeName: storeByLocation.name,
            latitude: storeByLocation.latitude,
            longitude: storeByLocation.longitude,
            isSavedStore: false,
            userStoreMode: state.userStoresEnabled,
            listId: state.selectedListId,
          ),
        );
      }
    }
  }

  // List<UserStoreListModel>에서 주어진 targetStoreUuid를 갖는 UserStoreModel 찾기
  UserStoreDataModel? _findUserStoreModelByStoreUuid(
    List<UserStoreListModel> storeLists,
    String targetStoreUuid,
  ) {
    for (final UserStoreListModel storeList in storeLists) {
      final List<UserStoreDataModel>? storeData = storeList.storeData;
      if (storeData == null) continue;

      for (final UserStoreDataModel store in storeData) {
        if (store.storeUuid == targetStoreUuid) {
          return store;
        }
      }
    }
    return null;
  }

  // 지도에 표시할 마커 생성
  Future<List<NMarker>> _createMarkers() async {
    final MapState state = ref.read(mapViewModelProvider);

    final UserStoreListState userStoreListState = ref.read(
      userStoreListViewModelProvider,
    );

    // default markers
    final List<Future<NMarker>> markers = <Future<NMarker>>[];

    for (final StoreByLocationModel e in state.storesByLocation) {
      final UserStoreDataModel? savedStore = _findUserStoreModelByStoreUuid(
        userStoreListState.userStoreLists,
        e.storeUuid,
      );

      if (savedStore == null || !state.userStoresEnabled) {
        markers.add(
          _storeToMarker(
            storeName: e.name,
            storeUuid: e.storeUuid,
            latitude: e.latitude,
            longitude: e.longitude,
            isSavedStore: false,
            userStoreMode: state.userStoresEnabled,
          ),
        );
      }
    }

    // saved markers
    final List<Future<NMarker>> savedMarkers = <Future<NMarker>>[];

    if (state.userStoresEnabled) {
      for (final UserStoreListModel e in userStoreListState.userStoreLists) {
        if (e.storeData?.isNotEmpty == true) {
          for (final UserStoreDataModel savedStore in e.storeData!) {
            savedMarkers.add(
              _storeToMarker(
                storeName: savedStore.name,
                storeUuid: savedStore.storeUuid,
                latitude: savedStore.latitude,
                longitude: savedStore.longitude,
                isSavedStore: true,
                userStoreMode: state.userStoresEnabled,
                listId: e.listId,
                backgroundColor:
                    StoreListIconColor.values
                        .firstWhereOrNull(
                          (StoreListIconColor color) =>
                              color.id == e.iconColorId,
                        )
                        ?.color,
              ),
            );
          }
        }
      }
    }

    final List<NMarker> totalMarkers = await Future.wait(<Future<NMarker>>[
      ...markers,
      ...savedMarkers,
    ]);

    return totalMarkers;
  }
}
