import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/map_page/components/google_map_page.dart';
import 'package:ramen_map_app/map_page/components/map_button.dart';
import 'package:ramen_map_app/map_page/components/search_address.dart';
import 'package:ramen_map_app/map_page/map_controller.dart';
import 'package:ramen_map_app/repository/store_repository.dart';
import 'package:ramen_map_app/service/auth_service.dart';

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
    final userId = ref.watch(authServiceProvider).userId;

    if (mapController.loading) {
      const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: FirestoreListView<Store>(
          query: ref
              .watch(storeRepositoryProvider)
              .queryDistanceStore(userId: userId),
          itemBuilder: (context, snapshot) {
            final store = snapshot.data();

            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Expanded(
                  child: mapController.initialPosition != null
                      ? Stack(
                          children: <Widget>[
                            GoogleMapPage(
                                store: store,
                                latitude: latitude,
                                longitude: longitude),
                            CustomInfoWindow(
                              controller:
                                  mapController.customInfoWindowController,
                              height: 100.0,
                              width: 100.0,
                              offset: 50.0,
                            )
                          ],
                        )
                      : Container(),
                ),
                storeId.isEmpty ? const SearchAddress() : const Text(""),
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
            );
          }),
    );
  }
}
