import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final mapControllerProvider = ChangeNotifierProvider<MapController>((ref) {
  return MapController(ref.read);
});

class MapController extends ChangeNotifier {
  final Reader reader;
  MapController(this.reader);
  Completer<GoogleMapController> conpleter = Completer();
}
