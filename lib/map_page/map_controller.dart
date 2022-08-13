import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/repository/store_repository.dart';
import 'package:ramen_map_app/service/google_map_service.dart';

final mapControllerProvider = ChangeNotifierProvider<MapController>((ref) {
  return MapController(ref.read);
});

class MapController extends ChangeNotifier {
  final Reader reader;
  MapController(this.reader) {
    getUserLocation();
    addMarker;
    loading = false;
  }

  List<AutocompletePrediction> predictions = [];
  List getLatLng = [];
  LatLng? initialPosition;
  Set<Marker> markers = {};
  bool loading = true;

  void addMarker(Store store) async {
    final marker = Marker(
        markerId: MarkerId(store.storeId),
        position: LatLng(store.latitude, store.longitude),
        infoWindow: InfoWindow(title: store.name, snippet: store.price));
    notifyListeners();
    markers.add(marker);
  }

  Set<Marker> createMarker(Store store) {
    return {
      Marker(
          markerId: MarkerId(store.storeId),
          position: LatLng(store.latitude, store.longitude),
          infoWindow: InfoWindow(title: store.name))
    };
  }

  Future<void> autoCompleteSearch(String inputAddress) async {
    final address = await reader(googleMapServiceProvider)
        .googlePlace
        .autocomplete
        .get(inputAddress);

    try {
      if (address != null && address.predictions != null) {
        predictions = address.predictions!;
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> getUserLocation() async {
    try {
      await Geolocator.requestPermission();
      final positon = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      initialPosition = LatLng(positon.latitude, positon.longitude);
      notifyListeners();
    } catch (e) {
      initialPosition = const LatLng(35.010362, 135.768735);
      notifyListeners();
    }
  }

  Future<void> getSelectedAddress(String location) async {
    List locations = await locationFromAddress(location);
    print(locations);
  }
}
