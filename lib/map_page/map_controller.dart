import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/service/google_map_service.dart';
import 'package:uuid/uuid.dart';

final mapControllerProvider = ChangeNotifierProvider<MapController>((ref) {
  return MapController(ref.read);
});

class MapController extends ChangeNotifier {
  final Reader reader;
  MapController(this.reader) {
    getUserLocation();
    predictions = [];
    loading = false;
    customInfoWindowController;
    notifyListeners();
  }

  final googleMapController = Completer<GoogleMapController>();

  List<AutocompletePrediction> predictions = [];
  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();
  List getLatLng = [];
  LatLng? initialPosition;
  Set<Marker> markers = {};
  bool loading = true;

  Future<void> addMarker({required Store store}) async {
    final marker = Marker(
      markerId: MarkerId(store.storeId),
      position: LatLng(store.latitude, store.longitude),
      infoWindow: InfoWindow(title: store.name),
      // onTap: () {
      //   customInfoWindowController.addInfoWindow!(
      //     CustomInfoWindowPage(
      //       store: store,
      //     ),
      //     LatLng(store.latitude, store.longitude),
      //   );
      //   notifyListeners();
      // },
    );
    markers.add(marker);
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
      // ignore: avoid_print
      print(e);
    }
    notifyListeners();
  }

  void changeMapType() {
    reader(googleMapServiceProvider).currentMapType =
        reader(googleMapServiceProvider).currentMapType == MapType.hybrid
            ? MapType.normal
            : MapType.hybrid;
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

  void resetAddress() {
    predictions = [];
    notifyListeners();
  }

  void resetMarker() {
    markers = {};
    notifyListeners();
  }

  Future<void> setMarker({required LatLng location}) async {
    final id = const Uuid().v4();
    final GoogleMapController mapController = await googleMapController.future;
    final zoomLevel = await mapController.getZoomLevel();
    markers = {};
    final marker = Marker(
        markerId: MarkerId(id),
        position: LatLng(location.latitude, location.longitude),
        infoWindow: InfoWindow(title: location.toString()));
    markers.add(marker);

    mapController.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(location.latitude, location.longitude),
            zoom: zoomLevel),
      ),
    );
    print(location);
    notifyListeners();
  }
}
