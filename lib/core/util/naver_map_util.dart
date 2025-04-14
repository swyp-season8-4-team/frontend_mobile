import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

abstract class NaverMapUtil {
  NaverMapUtil._();

  /// 현재 카메라가 보고 있는 영역만큼의 위치정보 제공
  static Future<({double lat, double lng, double radius})> getLocationInfo({
    required NaverMapController controller,
  }) async {
    // 위도 1도의 거리
    const double killometerPerLatitude = 6400 * 2 * pi / 360;

    final NCameraPosition nCameraPosition =
        await controller.getCameraPosition();

    final NLatLngBounds latLngBounds = await controller.getContentBounds();

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

  /// 주어진 좌표로 카메라 이동
  static Future<void> moveCameraToLocation({
    required NaverMapController controller,
    required double lat,
    required double lng,
  }) async {
    final NCameraPosition cameraPosition = await controller.getCameraPosition();

    await controller.updateCamera(
      NCameraUpdate.fromCameraPosition(
        NCameraPosition(target: NLatLng(lat, lng), zoom: cameraPosition.zoom),
      ),
    );
  }

  /// 나의 실제 위치에 Custom Overlay 표시
  static Future<void> setMyLocationOverlay({
    required NaverMapController controller,
    String assetPath = 'asset/image/current_location.png',
  }) async {
    final NLocationOverlay locationOverlay = controller.getLocationOverlay();

    // NOverlayImage.fromAssetImage는 svg를 지원하지 않음
    final NOverlayImage locationOverlayImage = NOverlayImage.fromAssetImage(
      assetPath,
    );

    locationOverlay
      ..setIcon(locationOverlayImage)
      ..setIconSize(const Size.square(50))
      ..setCircleColor(Colors.transparent)
      ..setIsVisible(false)
      ..setIsVisible(true);
  }
}
