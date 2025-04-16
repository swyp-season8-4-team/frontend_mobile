import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/dessert_mate_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/chip/floating_chip.dart';
import 'package:frontend_mobile/common/design_system/component/etc/map/map_icon_button.dart';
import 'package:frontend_mobile/common/design_system/component/etc/map/saved_store_list.dart';
import 'package:frontend_mobile/common/design_system/component/etc/option_menu_dropdown.dart';
import 'package:frontend_mobile/common/design_system/component/navigation_bar/navigation_bar.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/main_top_bar.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/design_system/component/etc/map/store_info_bottom_sheet_content.dart';
import 'package:frontend_mobile/common/design_system/component/etc/marker/default_marker.dart';
import 'package:frontend_mobile/common/design_system/foundation/shadow/shadow_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/manager/geolocation/geo_location_service_impl.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading_overlay.dart';
import 'package:frontend_mobile/core/util/naver_map_util.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/domain/model/store/store_by_location_model.dart';
import 'package:frontend_mobile/presentation/map/map_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';

import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

part 'local_widget/store_list_sheet.dart';
part 'local_widget/bottom_navigation_bar.dart';

part 'extension/map_view_extensions.dart';
part 'extension/map_method_extensions.dart';

class MapView extends ConsumerStatefulWidget {
  const MapView({super.key});

  @override
  ConsumerState<MapView> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapView> {
  final double _zoom = 12;

  late final NaverMapController _mapController;
  late final DraggableScrollableController _draggableScrollableController;

  // draggable scrollable sheet의 snap size
  final double _snapSize = 0.5;

  bool _isStoreListAppbarVisible = false;

  @override
  void initState() {
    super.initState();
    _draggableScrollableController = DraggableScrollableController();
    _draggableScrollableController.addListener(_draggableScrollableListener);
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
    // TODO: Viewmodel을 통한 상태관리 필요
    final MapState state = ref.watch(mapViewModelProvider);

    final TopBarIcon topBarIcon = TopBarIcon();
    ref.listen(
      mapViewModelProvider.select((MapState state) => state.storesByLocation),
      (_, List<StoreByLocationModel> next) async {
        await _mapController.clearOverlays();

        final List<NMarker> markers = await Future.wait(<Future<NMarker>>[
          ...next.map((StoreByLocationModel e) => _storeToMarker(model: e)),
        ]);

        await _mapController.addOverlayAll(markers.toSet());

        await NaverMapUtil.setMyLocationOverlay(controller: _mapController);
      },
    );

    ref.listen(
      mapViewModelProvider.select(
        (MapState state) => state.getStoreSummaryStatus,
      ),
      (_, Status next) async {
        if (next.isSuccess) {
          final MapState state = ref.read(mapViewModelProvider);
          await _mapController.deleteOverlay(
            NOverlayInfo(
              type: NOverlayType.marker,
              id: state.selectedMarker!.info.id,
            ),
          );

          final NMarker newMarker = NMarker(
            id: state.selectedMarker!.info.id,
            position: state.selectedMarker!.position,
            anchor: state.selectedMarker!.anchor,
            size: const Size(60, 66),
            icon: NOverlayImage.fromAssetImage(
              Assets.image.markerSelected.path,
            ),
          );

          await _mapController.addOverlay(newMarker);
        }
      },
    );

    return CustomLoadingOverlay(
      isLoading:
          state.getAllPreferencesStatus.isLoading ||
          state.getStoresByLocationStatus.isLoading,
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
              bottom: 80,
              child: NaverMap(
                options: NaverMapViewOptions(
                  initialCameraPosition: NCameraPosition(
                    // TODO: 첫 로딩 시 카메라의 위치를 임의로 강남구로 지정
                    target: const NLatLng(37.514575, 127.0495556),
                    zoom: _zoom,
                  ),
                ),
                onMapReady: (NaverMapController controller) async {
                  _mapController = controller;

                  await _goToCurrentLocation();

                  await NaverMapUtil.setMyLocationOverlay(
                    controller: _mapController,
                  );

                  setState(() {});
                },
                onMapTapped: (_, _) {
                  _clearSelectedShop();
                },
              ),
            ),
            Positioned(top: 16, left: 0, child: _buildFilterList()),
            Positioned(
              top: 56,
              left: 16,
              child: CustomDessertMateButton(onPressed: () {}),
            ),
            Positioned(top: 56, right: 16, child: _buildControlButtons()),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildRefreshButton(),
            ),
            Positioned(
              top: 56,
              right: 16,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CustomMapIconButton.saveStore(
                    isSelected: true,
                    onPressed: () async {
                      await _draggableScrollableController.animateTo(
                        _snapSize,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomMapIconButton.myLocation(
                    isSelected: false,
                    onPressed: () {
                      _goToCurrentLocation();
                    },
                  ),
                ],
              ),
            ),
            const _BottomNavigation(),
            _StoreListSheet(
              draggableScrollableController: _draggableScrollableController,
              snapSize: _snapSize,
              isStoreListAppBarVisible: _isStoreListAppbarVisible,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    _draggableScrollableController.dispose();
    super.dispose();
  }
}
