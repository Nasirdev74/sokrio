import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:sokrio/cache/cache_database.dart';
import 'package:sokrio/main.dart';
import 'package:sokrio/model/model.dart';
import 'package:sokrio/utils/support.dart';

class VisitedLocationController extends GetxController {
  final List<LocationData> locationDatas = [];
  final List<LocationData> searchedDatas = [];
  final List<CacheLocation> onlineLocations = [];
  bool isSearched = false;

  final CacheDatabase cacheDatabase = CacheDatabase.instance;
  final searchTextController = TextEditingController();

  /// used to search for location in location data list
  searchLocation() {
    if(searchTextController.text.removeAllWhitespace.isEmpty) return;
    isSearched = true;
    update();
    final searchKey = searchTextController.text.trim();
    final List<LocationData> results = locationDatas.where((element) {
      if (element.placemark != null) {
        final street = element.placemark?.street ?? '';
        final thoroughfare = element.placemark?.thoroughfare ?? '';
        final country = element.placemark?.country ?? '';
        final administrativeArea = element.placemark?.administrativeArea ?? '';
        final subAdministrativeArea = element.placemark?.subAdministrativeArea ?? '';
        final locality = element.placemark?.locality ?? '';
        final subLocality = element.placemark?.subLocality ?? '';
        final subThoroughfare = element.placemark?.subThoroughfare ?? '';

        if (street.contains(searchKey) ||
            thoroughfare.contains(searchKey) ||
            country.contains(searchKey) ||
            administrativeArea.contains(searchKey) ||
            subAdministrativeArea.contains(searchKey) ||
            locality.contains(searchKey) ||
            subLocality.contains(searchKey) ||
            subThoroughfare.contains(searchKey)) {
          return true;
        }
        return false;
      }
      return false;
    }).toList();
    if (results.isNotEmpty) {
      searchedDatas.removeWhere((element) => results.contains(element));
      searchedDatas.assignAll([...results, ...searchedDatas]);
    }
    update();
  }

  /// loading all cache data from online data table only
  initialLoadLocationData() async {
    onlineLocations.assignAll((await cacheDatabase.getAllLocation(tableName: onlineLocationsTable)).reversed);
    for (CacheLocation onlineLocation in onlineLocations) {
      final LocationData locationData = LocationData(cacheLocation: onlineLocation);
      List<Placemark> placemarks = await placemarkFromCoordinates(
        onlineLocation.latitude,
        onlineLocation.longitude,
      );
      if (placemarks.isNotEmpty) {
        locationData.placemark = placemarks.first;
      }
      locationDatas.add(locationData);
      update();
    }
    onlineLocations.assignAll([]);
    dPrint('[VisitedLocationController] location data list updated: ${locationDatas.length}');
  }

  /// checking if there is any data in offline data table
  checkOfflineData() async {
    final offlineLocations = await cacheDatabase.getAllLocation(tableName: offlineLocationsTable);
    if (offlineLocations.isNotEmpty) {
      for (var offlineLocation in offlineLocations) {
        final cacheLocation = offlineLocation.copyWith(id: null);
        cacheDatabase.addLocation(
          cacheLocation: cacheLocation,
          tableName: onlineLocationsTable,
        ).whenComplete(() {
          cacheDatabase.deleteLocation(
            cacheLocation: offlineLocation,
            tableName: offlineLocationsTable,
          );
        });
      }
      /// re-sync app data with online data table
      locationDatas.assignAll([]);
      await initialLoadLocationData();
    }
  }

  /// used to save new location on cache database
  saveNewLocation() async {
    /// checking connectivity
    var connectivityResult = await Connectivity().checkConnectivity();
    bool isOnline = connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.ethernet;

    dPrint('[ConnectivityResult] isOnline: $isOnline');
    Position? position = await Support.getPosition();
    if (position != null) {
      final cacheLocation = CacheLocation(
          latitude: position.latitude,
          longitude: position.longitude,
          altitude: position.altitude,
          timestamp: DateFormat('yyyy-MM-ddThh:mm:ss').format(DateTime.now()));

      cacheDatabase.addLocation(
        cacheLocation: cacheLocation,
        tableName: isOnline ? onlineLocationsTable : offlineLocationsTable,
      );
      if (isOnline) {
        await checkOfflineData();
        onlineLocations.add(cacheLocation);
        await updateLocationDatas();
      }
      update();
    }
  }

  /// updates the in app location list to update the UI
  updateLocationDatas() async {
    for (CacheLocation onlineLocation in onlineLocations) {
      final LocationData locationData = LocationData(cacheLocation: onlineLocation);
      List<Placemark> placemarks = await placemarkFromCoordinates(
        onlineLocation.latitude,
        onlineLocation.longitude,
      );
      if (placemarks.isNotEmpty) {
        locationData.placemark = placemarks.first;
      }
      locationDatas.add(locationData);
      update();
    }
    onlineLocations.assignAll([]);
  }

  @override
  void onInit() async {
    super.onInit();
    await initialLoadLocationData();
    await saveNewLocation();
    Stream.periodic(const Duration(minutes: 5)).listen((_) async {
      await saveNewLocation();
    });
  }

  @override
  void onClose() {
    super.onClose();
    cacheDatabase.close();
  }
}
