import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_place/google_place.dart';

final googleMapServiceProvider = Provider<GoogleMapService>((ref) {
  return GoogleMapService();
});

class GoogleMapService {
  final googlePlace = GooglePlace("AIzaSyBS_B-VRHZqZIXgItX6ylwU-cwsEZ7P94Y");
}
