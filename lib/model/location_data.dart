import 'package:geocoding/geocoding.dart';
import 'package:sokrio/model/cache_location.dart';

class LocationData {
  LocationData({
    this.image,
    this.placemark,
    required this.cacheLocation,
  });

  String? image;
  Placemark? placemark;
  final CacheLocation cacheLocation;

  @override
  String toString() {
    return 'LocationData{image: $image, placemark: $placemark, cacheLocation: $cacheLocation}';
  }
}
