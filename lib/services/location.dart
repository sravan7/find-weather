import 'package:geolocator/geolocator.dart';

class Location {
  double lat, lon;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      lat = position.latitude;
      lon = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
