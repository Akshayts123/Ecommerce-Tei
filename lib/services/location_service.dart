import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  // serviceEnabled = await Geolocator.isLocationServiceEnabled();
  // if (!serviceEnabled) {
  //   // Location services are not enabled don't continue
  //   // accessing the position and request users of the
  //   // App to enable the location services.
  //   return Future.error('Location services are disabled.');
  // }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return null;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return null;
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  // print('::::::: permission :::::::: ' + permission.toString());
  try {
    final latlng = await Geolocator.getCurrentPosition();
    print("${latlng.latitude} ${latlng.longitude}");
    final position = await placemarkFromCoordinates(latlng.latitude, latlng.longitude);
    Placemark place = position[0];
    final locationstr = "${place.subLocality} ${place.thoroughfare}";
    return locationstr;
  } catch (e) {
    return null;
  }
}
