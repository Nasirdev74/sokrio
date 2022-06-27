const String onlineLocationsTable = 'onlineLocationsTable';
const String offlineLocationsTable = 'offlineLocationsTable';

class CacheLocationsFields {
  static const id = 'id';
  static const latitude = 'latitude';
  static const longitude = 'longitude';
  static const altitude = 'altitude';
  static const timestamp = 'timestamp';

  static const List<String> cacheLocationsFieldsValues = [
    id,
    latitude,
    longitude,
    altitude,
    timestamp,
  ];
}

class CacheLocation {
  CacheLocation({
    this.id,
    required this.latitude,
    required this.longitude,
    required this.altitude,
    required this.timestamp,
  });

  CacheLocation.empty();

  CacheLocation.fromJson(dynamic json) {
    id = json[CacheLocationsFields.id] ?? 0;
    latitude = json[CacheLocationsFields.latitude] ?? 0;
    longitude = json[CacheLocationsFields.longitude] ?? 0;
    altitude = json[CacheLocationsFields.altitude] ?? 0;
    timestamp = json[CacheLocationsFields.timestamp] ?? '';
  }

  int? id;
  double latitude = 0;
  double longitude = 0;
  double altitude = 0;
  String timestamp = '';

  CacheLocation copyWith({
    int? id,
    double? latitude,
    double? longitude,
    double? altitude,
    String? timestamp,
  }) =>
      CacheLocation(
        id: id,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        altitude: altitude ?? this.altitude,
        timestamp: timestamp ?? this.timestamp,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map[CacheLocationsFields.id] = id;
    map[CacheLocationsFields.latitude] = latitude;
    map[CacheLocationsFields.longitude] = longitude;
    map[CacheLocationsFields.altitude] = altitude;
    map[CacheLocationsFields.timestamp] = timestamp;
    return map;
  }

  @override
  String toString() {
    return 'CacheLocation{id: $id, latitude: $latitude, longitude: $longitude, altitude: $altitude, timestamp: $timestamp}';
  }
}
