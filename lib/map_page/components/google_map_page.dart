import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ramen_map_app/map_page/map_controller.dart';
import 'package:ramen_map_app/service/google_map_service.dart';
import 'package:ramen_map_app/set_store_page/set_store_page.dart';

class GoogleMapPage extends ConsumerWidget {
  const GoogleMapPage(
      {Key? key, required this.latitude, required this.longitude})
      : super(key: key);
  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapControllerProvider);

    return GoogleMap(
      mapType: ref.watch(googleMapServiceProvider).currentMapType,
      myLocationEnabled: true,
      initialCameraPosition: CameraPosition(
          target: latitude == 0.0
              ? mapController.initialPosition!
              : LatLng(latitude, longitude),
          zoom: 15.0),
      onMapCreated: (GoogleMapController controller) {
        controller = controller;
        mapController.customInfoWindowController.addInfoWindow;
      },
      minMaxZoomPreference: const MinMaxZoomPreference(10, 20),
      cameraTargetBounds: CameraTargetBounds(LatLngBounds(
        northeast: const LatLng(35.993758, 136.40452), //北・西
        southwest: const LatLng(33.382718, 134.15505), //南・東
      )),
      markers: mapController.markers,
      onLongPress: ((location) {
        location = location;
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SetStorePage(
              latitude: location.latitude,
              longitude: location.longitude,
            ),
          ),
        );
      }),
    );
  }
}
