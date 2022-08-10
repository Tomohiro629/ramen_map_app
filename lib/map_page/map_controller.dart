import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final mapControllerProvider = ChangeNotifierProvider<MapController>((ref) {
  return MapController(ref.read);
});

class MapController extends ChangeNotifier {
  final Reader _reader;
  MapController(this._reader);
  Completer<GoogleMapController> conpleter = Completer();
  final position =
      const CameraPosition(target: LatLng(34.985409, 135.758102), zoom: 15);

  void changeMapType() {
    MapType currentMapType = MapType.hybrid;
    currentMapType == MapType.hybrid ? MapType.normal : MapType.hybrid;
    notifyListeners();
  }
}
