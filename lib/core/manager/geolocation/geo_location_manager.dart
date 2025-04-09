import 'package:geolocator/geolocator.dart';

abstract interface class GeoLocationManager {
  // 위치 권한 요청
  Future<void> requestPermission();

  // 현재 위치 조회
  Future<Position> getCurrentPosition();
}
