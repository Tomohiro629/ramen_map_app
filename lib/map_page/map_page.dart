import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ramen_map_app/map_page/map_controller.dart';
import 'package:ramen_map_app/service/google_map_service.dart';

class MapPage extends ConsumerWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapControllerProvider);
    final mapService = ref.watch(googleMapServiceProvider);
    final inputAddress = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Map",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: mapService.position,
              onMapCreated: (GoogleMapController controller) {
                mapController.conpleter;
              },
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 300.0,
                child: TextFormField(
                  controller: inputAddress,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: "検索",
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search_outlined),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  maxLength: 50,
                  maxLines: null,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 20.0,
                  ),
                  // FloatingActionButton(
                  //     backgroundColor: Colors.white,
                  //     onPressed: () {},
                  //     child: const Icon(Icons.map)),
                  // const SizedBox(
                  //   height: 10.0,
                  // ),
                ]),
          ),
        ],
      ),
    );
  }
}
