import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final googleMapServiceProvider = Provider<GoogleMapService>((ref) {
  return GoogleMapService();
});

class GoogleMapService {
  final position =
      const CameraPosition(target: LatLng(34.985409, 135.758102), zoom: 15);
}
