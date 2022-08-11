import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
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

    if (mapController.loading) {
      const Center(child: CircularProgressIndicator());
    }

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
            child: mapController.initialPosition != null
                ? GoogleMap(
                    mapType: MapType.hybrid,
                    myLocationEnabled: true,
                    initialCameraPosition: CameraPosition(
                        target: mapController.initialPosition!, zoom: 15.0),
                    onMapCreated: (GoogleMapController controller) {
                      mapService.conpleter;
                    },
                  )
                : Container(),
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
                  decoration: InputDecoration(
                    hintText: "検索",
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (inputAddress.text.isNotEmpty) {
                          mapController.predictions = [];
                          mapController.autoCompleteSearch(inputAddress.text);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("住所を入力してください"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.search_outlined),
                      hoverColor: Colors.amber,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  maxLength: 50,
                  maxLines: null,
                ),
              ),
              SizedBox(
                height: 150.0,
                width: 300.0,
                child: Flexible(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: mapController.predictions.length,
                      itemBuilder: ((context, index) {
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                              title: Text(mapController
                                  .predictions[index].description
                                  .toString()),
                              onTap: () async {
                                mapController.getSelectedAddress(mapController
                                    .predictions[index].description
                                    .toString());
                              }),
                        );
                      })),
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
