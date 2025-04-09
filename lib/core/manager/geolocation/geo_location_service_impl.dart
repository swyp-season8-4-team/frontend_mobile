import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/manager/geolocation/geo_location_manager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:frontend_mobile/core/manager/geolocation/geo_location_exception.dart';

final Provider<GeoLocationManager> geoLocationManagerProvider =
    Provider<GeoLocationManager>((Ref ref) {
      return GeoLocationManagerImpl();
    });

/// Geo Location 관련 기능을 제공하는 Manager
class GeoLocationManagerImpl implements GeoLocationManager {
  @override
  Future<void> requestPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationServiceNotEnabled();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationPermissionTemporaliyDenied();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationPermissionPermanentlyDenied();
    }
  }

  @override
  Future<Position> getCurrentPosition() async {
    await requestPermission();
    final Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
