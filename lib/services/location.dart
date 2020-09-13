import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      print('printing from Location class getCurrentLocation(): $position');
    } catch (e) {
      print('exception!!!! in getCurrentLocation()');
    }
  }
}
