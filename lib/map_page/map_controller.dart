import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:ramen_map_app/service/google_map_service.dart';

final mapControllerProvider = ChangeNotifierProvider<MapController>((ref) {
  return MapController(ref.read);
});

class MapController extends ChangeNotifier {
  final Reader reader;
  MapController(this.reader) {
    getUserLocation();
    loading = false;
  }

  Completer<GoogleMapController> conpleter = Completer();
  List<AutocompletePrediction> predictions = [];
  LatLng? initialPosition;
  bool loading = true;

  Future<void> autoCompleteSearch(String inputAddress) async {
    final address = await reader(googleMapServiceProvider)
        .googlePlace
        .autocomplete
        .get(inputAddress);
    print(predictions);
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
      print(positon);
    } catch (e) {
      initialPosition = const LatLng(35.010362, 135.768735);
      notifyListeners();
    }
  }

  Future<void> moveSearchAddress(int index) async {
    predictions = [];

    {}
    notifyListeners();
  }
}
