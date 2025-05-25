import 'package:collection/collection.dart';
import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/dessert_mate_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/chip/floating_chip.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/etc/map/map_icon_button.dart';
import 'package:frontend_mobile/common/design_system/component/etc/map/saved_store_list.dart';
import 'package:frontend_mobile/common/design_system/component/etc/map/store_info_bottom_sheet_content.dart';
import 'package:frontend_mobile/common/design_system/component/etc/marker/default_marker.dart';
import 'package:frontend_mobile/common/design_system/component/etc/marker/saved_marker.dart';
import 'package:frontend_mobile/common/design_system/component/etc/option_menu_dropdown.dart';
import 'package:frontend_mobile/common/design_system/component/navigation_bar/navigation_bar.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar_right_item.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/main_top_bar.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/design_system/foundation/foundation.dart';
import 'package:frontend_mobile/common/design_system/foundation/shadow/shadow_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/manager/geolocation/geo_location_service_impl.dart';
import 'package:frontend_mobile/core/manager/toast/toast_manager.dart';
import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/core/resource/extension.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/core/util/naver_map_util.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/domain/model/store/store_by_location_model.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_model.dart';
import 'package:frontend_mobile/presentation/global/preference/preference_view_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:frontend_mobile/presentation/global/user_store/user_store_list_view_model.dart';
import 'package:frontend_mobile/presentation/map/map_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/widget/desserbee_bottom_navigation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

part 'extension/map_method_extensions.dart';
part 'extension/map_view_extensions.dart';
part 'local_widget/store_list_sheet.dart';

class MapView extends ConsumerStatefulWidget {
  const MapView({super.key});

  @override
  ConsumerState<MapView> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapView> {
  final double _zoom = 12;

  NaverMapController? _mapController;
  late final DraggableScrollableController _draggableScrollableController;

  // draggable scrollable sheet의 snap size
  final double _snapSize = 0.5;

  bool _isStoreListAppbarVisible = false;

  @override
  void initState() {
    super.initState();
    _draggableScrollableController = DraggableScrollableController();
    _draggableScrollableController.addListener(_draggableScrollableListener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final UserState userState = ref.read(userViewModelProvider);
      ref
          .read(userStoreListViewModelProvider.notifier)
          .getUserStoreListAll(userUuid: userState.data.userUuid);

      ref.read(preferenceViewModelProvider.notifier).getAllPreferences();
    });
  }

  void _draggableScrollableListener() {
    if (_draggableScrollableController.size >= 0.99) {
      if (!_isStoreListAppbarVisible) {
        setState(() {
          _isStoreListAppbarVisible = true;
        });
      }
    } else {
      if (_isStoreListAppbarVisible) {
        setState(() {
          _isStoreListAppbarVisible = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final MapState state = ref.watch(mapViewModelProvider);

    final UserStoreListState userStoreListState = ref.watch(
      userStoreListViewModelProvider,
    );
    final UserStoreListViewModel userStoreListViewModel = ref.read(
      userStoreListViewModelProvider.notifier,
    );

    final PreferenceState preferenceState = ref.watch(
      preferenceViewModelProvider,
    );

    final TopBarIcon topBarIcon = TopBarIcon();

    _listenProvider();

    return GestureDetector(
      onTap: () {
        userStoreListViewModel.invisibleAllOptionMenu();
      },
      child: CustomLoadingOverlay(
        isLoading:
            preferenceState.status.isLoading ||
            state.getStoresByLocationStatus.isLoading ||
            userStoreListState.getUserStoreListAllStatus.isLoading ||
            state.deleteUserStoreListStatus.isLoading ||
            _mapController == null,
        child: Scaffold(
          appBar:
              _isStoreListAppbarVisible
                  ? CustomSubTopBar(
                    title: '찜한 가게',
                    primary: false,
                    leading: topBarIcon.leftLine(
                      onTap: () {
                        _draggableScrollableController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                    ),
                    actions: <Widget>[
                      topBarIcon.close(
                        onTap: () {
                          _draggableScrollableController.animateTo(
                            _snapSize,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
                    ],
                  )
                  : CustomMainTopBar(
                    onSearchIconTap: () {
                      context.pushNamed(AppRoutes.searchStore.name);
                    },
                  ),
          body: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 80 + MediaQuery.of(context).padding.bottom,
                child: NaverMap(
                  options: NaverMapViewOptions(
                    initialCameraPosition: NCameraPosition(
                      // 첫 로딩 시 카메라의 위치를 임의로 강남구로 지정
                      target: const NLatLng(37.514575, 127.0495556),
                      zoom: _zoom,
                    ),
                    minZoom: 6,
                    rotationGesturesEnable: false,
                  ),
                  onMapReady: (NaverMapController controller) async {
                    _mapController = controller;

                    await _goToCurrentLocation();

                    await NaverMapUtil.setMyLocationOverlay(
                      controller: _mapController!,
                    );

                    setState(() {});
                  },
                  onMapTapped: (_, _) {
                    _clearSelectedShop();
                  },
                ),
              ),
              Positioned(top: 0, left: 0, child: _buildFilterList()),
              Positioned(
                top: 56,
                left: 16,
                child: CustomDessertMateButton(
                  onPressed: () {
                    context.goNamed(AppRoutes.dessertBoard.name);
                  },
                ),
              ),
              Positioned(top: 56, right: 16, child: _buildControlButtons()),
              if (!state.userStoresEnabled)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildRefreshButton(),
                )
              else
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildUserStoreListButton(),
                ),
              const Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: DesserbeeBottomNavigation(
                  currentItemType: NavigationItemType.map,
                ),
              ),
              _StoreListSheet(
                draggableScrollableController: _draggableScrollableController,
                snapSize: _snapSize,
                isStoreListAppBarVisible: _isStoreListAppbarVisible,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listenProvider() {
    final MapViewModel viewmodel = ref.read(mapViewModelProvider.notifier);
    ref.listen(
      mapViewModelProvider.select((MapState state) => state.storesByLocation),
      (_, List<StoreByLocationModel> next) async {
        if (_mapController == null) return;
        await _mapController!.clearOverlays();
        final List<NMarker> markers = await _createMarkers();
        await _mapController!.addOverlayAll(markers.toSet());
        await NaverMapUtil.setMyLocationOverlay(controller: _mapController!);
      },
    );

    ref.listen(
      userStoreListViewModelProvider.select(
        (UserStoreListState state) => state.userStoreLists,
      ),
      (_, List<UserStoreListModel> next) async {
        if (_mapController == null) return;
        await _mapController!.clearOverlays();
        final List<NMarker> markers = await _createMarkers();

        await _mapController!.addOverlayAll(markers.toSet());
        await NaverMapUtil.setMyLocationOverlay(controller: _mapController!);
      },
    );

    ref.listen(
      mapViewModelProvider.select((MapState e) => e.userStoresEnabled),
      (_, bool next) {
        final UserStoreListViewModel userStoreListViewModel = ref.read(
          userStoreListViewModelProvider.notifier,
        );
        if (next) {
          final UserState userState = ref.read(userViewModelProvider);
          userStoreListViewModel.getUserStoreListAll(
            userUuid: userState.data.userUuid,
          );
        } else {
          viewmodel.getStoresByLocation();
        }
      },
    );

    ref.listen(
      mapViewModelProvider.select(
        (MapState state) => state.getStoreSummaryStatus,
      ),
      (_, Status next) async {
        if (next.isSuccess) {
          if (_mapController == null) return;
          final MapState state = ref.read(mapViewModelProvider);
          await _mapController!.deleteOverlay(
            NOverlayInfo(
              type: NOverlayType.clusterableMarker,
              id: state.selectedMarker!.info.id,
            ),
          );

          final NMarker newMarker = NClusterableMarker(
            id: state.selectedMarker!.info.id,
            position: state.selectedMarker!.position,
            anchor: state.selectedMarker!.anchor,
            size: const Size(60, 66),
            // 정확한 asset path 지정 (flutter_gen 사용 x)
            icon: const NOverlayImage.fromAssetImage(
              'asset/image/4.0x/marker_selected.png',
            ),
          );

          await _mapController!.addOverlay(newMarker);
        }
      },
    );

    ref.listen(
      mapViewModelProvider.select(
        (MapState state) => state.deleteUserStoreListStatus,
      ),
      (_, Status next) {
        if (next.isSuccess) {
          final UserState userState = ref.read(userViewModelProvider);
          final UserStoreListViewModel userStoreListViewModel = ref.read(
            userStoreListViewModelProvider.notifier,
          );
          userStoreListViewModel.getUserStoreListAll(
            userUuid: userState.data.userUuid,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    if (_mapController != null) {
      _mapController!.dispose();
    }
    _draggableScrollableController.dispose();
    super.dispose();
  }
}
