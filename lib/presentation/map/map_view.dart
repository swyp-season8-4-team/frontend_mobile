import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    return ScaffoldWithNavigationBar(
      body: NaverMap(
        options: NaverMapViewOptions(
          initialCameraPosition: NCameraPosition(
            // TODO: 첫 로딩 시 카메라의 위치를 임의로 강남구로 지정
            target: const NLatLng(37.514575, 127.0495556),
            zoom: _zoom,
          ),
          locationButtonEnable: true,
        ),
        onMapReady: (NaverMapController controller) {
          _mapController = controller;

          _goToCurrentLocation();
          setState(() {});
        },
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

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
