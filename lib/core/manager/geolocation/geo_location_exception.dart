sealed class LocationError implements Exception {
  LocationError(this.message);
  final String message;
}

class LocationServiceNotEnabled extends LocationError {
  LocationServiceNotEnabled()
    : super('Device location service is not enabled.');
}

class LocationPermissionTemporaliyDenied extends LocationError {
  LocationPermissionTemporaliyDenied()
    : super('User denied the location tracking permission.');
}

class LocationPermissionPermanentlyDenied extends LocationError {
  LocationPermissionPermanentlyDenied()
    : super('Tracking location permission is permanently denied.');
}

class LocationNotFound extends LocationError {
  LocationNotFound() : super("Location can not track user's current location.");
}
