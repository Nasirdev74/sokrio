import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Support {
  static Future<Position?> getPosition() async {
    bool serviceEnabled = false;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      permission = await Geolocator.requestPermission();
      await Permission.location.request();
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          await Geolocator.openLocationSettings();
          serviceEnabled = await Geolocator.isLocationServiceEnabled();
          if (!serviceEnabled) {
            return null;
          }
        }
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Permission.location.request();
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await Permission.location.request();
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          await Geolocator.openAppSettings();
          permission = await Geolocator.requestPermission();
        }
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Geolocator.openAppSettings();
    }

    return await Geolocator.getCurrentPosition();
  }
}
