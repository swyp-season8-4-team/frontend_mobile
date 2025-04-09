import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/dessert_mate_button.dart';
import 'package:frontend_mobile/common/design_system/component/chip/floating_chip.dart';
import 'package:frontend_mobile/common/design_system/component/etc/map/map_icon_button.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/main_top_bar.dart';
import 'package:frontend_mobile/core/manager/geolocation/geo_location_service_impl.dart';
import 'package:frontend_mobile/presentation/widget/scaffold_with_navigation_bar.dart';
import 'package:geolocator/geolocator.dart';

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

    return ScaffoldWithNavigationBar(
      appBar: const CustomMainTopBar(),
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

              await _mapController.setLocationTrackingMode(
                NLocationTrackingMode.noFollow,
              );

              await _setCustomLocationOverlay();

              await _goToCurrentLocation();

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
        ..setIsVisible(true);
    }
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
