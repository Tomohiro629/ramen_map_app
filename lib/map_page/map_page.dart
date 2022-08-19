import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ramen_map_app/map_page/components/map_button.dart';
import 'package:ramen_map_app/map_page/map_controller.dart';
import 'package:ramen_map_app/service/google_map_service.dart';
import 'package:ramen_map_app/set_store_page/set_store_page.dart';

class MapPage extends ConsumerWidget {
  const MapPage(
      {Key? key,
      required this.storeId,
      required this.latitude,
      required this.longitude})
      : super(key: key);
  final String storeId;
  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapControllerProvider);
    final inputAddress = TextEditingController();

    if (mapController.loading) {
      const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Expanded(
            child: mapController.initialPosition != null
                ? Stack(
                    children: <Widget>[
                      GoogleMap(
                        mapType:
                            ref.watch(googleMapServiceProvider).currentMapType,
                        myLocationEnabled: true,
                        initialCameraPosition: CameraPosition(
                            target: latitude == 0.0
                                ? mapController.initialPosition!
                                : LatLng(latitude, longitude),
                            zoom: 15.0),
                        onMapCreated: (GoogleMapController controller) {
                          controller = controller;
                          mapController
                              .customInfoWindowController.addInfoWindow;
                        },
                        minMaxZoomPreference:
                            const MinMaxZoomPreference(10, 20),
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
                      ),
                      CustomInfoWindow(
                        controller: mapController.customInfoWindowController,
                        height: 100.0,
                        width: 100.0,
                        offset: 50.0,
                      )
                    ],
                  )
                : Container(),
          ),
          storeId.isEmpty
              ? Column(
                  children: [
                    const SizedBox(
                      height: 60.0,
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
                                mapController
                                    .autoCompleteSearch(inputAddress.text);
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
                    mapController.predictions.isNotEmpty
                        ? SizedBox(
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
                                            List location =
                                                await locationFromAddress(
                                                    mapController
                                                        .predictions[index]
                                                        .description
                                                        .toString());
                                            // ignore: use_build_context_synchronously
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SetStorePage(
                                                  latitude:
                                                      location.first.latitude,
                                                  longitude:
                                                      location.first.longitude,
                                                ),
                                              ),
                                            );
                                          }),
                                    );
                                  })),
                            ),
                          )
                        : const Text(""),
                  ],
                )
              : const Text(""),
          Padding(
            padding: const EdgeInsets.only(
              top: 120.0,
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: MapButton(
                      icon: const Icon(
                        Icons.map_outlined,
                        color: Colors.deepOrange,
                      ),
                      onTap: () {
                        mapController.changeMapType();
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: MapButton(
                      icon: const Icon(
                        Icons.autorenew_rounded,
                        color: Colors.deepOrange,
                      ),
                      onTap: (() {
                        mapController.resetAddress();
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
