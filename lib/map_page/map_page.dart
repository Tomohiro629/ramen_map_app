import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ramen_map_app/map_page/map_controller.dart';

class MapPage extends ConsumerWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapControllerProvider);
    return Scaffold(
        body: GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: mapController.position,
      onMapCreated: (GoogleMapController controller) {
        mapController.conpleter;
      },
    ));
  }
}
