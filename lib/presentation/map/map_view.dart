import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/dessert_mate_button.dart';
import 'package:frontend_mobile/common/design_system/component/chip/floating_chip.dart';
import 'package:frontend_mobile/common/design_system/component/etc/map/map_icon_button.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/main_top_bar.dart';
import 'package:frontend_mobile/core/manager/geolocation/geo_location_service_impl.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/presentation/map/map_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/widget/scaffold_with_navigation_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

class MapView extends ConsumerStatefulWidget {
  const MapView({super.key});

  @override
  ConsumerState<MapView> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapView> {
  final double _zoom = 12;

  late final NaverMapController _mapController;

  @override
  Widget build(BuildContext context) {
    // TODO: Viewmodel을 통한 상태관리 필요
    final MapState state = ref.watch(mapViewModelProvider);

    // TODO: 로딩 UI 변경 필요
    if (state.getAllPreferencesStatus.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return ScaffoldWithNavigationBar(
      appBar: CustomMainTopBar(
        onSearchIconTap: () {
          context.pushNamed(AppRoutes.searchStore.name);
        },
      ),
      body: Stack(
        children: <Widget>[
          NaverMap(
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

              await _setCustomLocationOverlay();

              setState(() {});
            },
          ),
          Positioned(
            top: 16,
            left: 0,
            child: SizedBox(
              height: 28,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: <Widget>[
                      CustomFloatingChip(label: '내 취향', onPressed: () {}),
                      ...state.preferences.mapIndexed(
                        (int index, PreferenceModel e) => Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: CustomFloatingChip(
                            label: e.preferenceName,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 56,
            left: 16,
            child: CustomDessertMateButton(onPressed: () {}),
          ),
          Positioned(
            top: 56,
            right: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CustomMapIconButton.saveStore(
                  isSelected: true,
                  onPressed: () {},
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
        ],
      ),
    );
  }

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

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
