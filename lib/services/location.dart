import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    } else {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        latitude = position.latitude;
        longitude = position.longitude;
      } catch (e) {
        throw '$e';
      }
    }
  }
}
