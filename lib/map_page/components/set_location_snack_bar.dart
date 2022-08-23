import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ramen_map_app/map_page/map_controller.dart';
import 'package:ramen_map_app/set_store_page/set_store_page.dart';

class SetLocationSnackBar extends ConsumerWidget {
  const SetLocationSnackBar({Key? key, required this.location})
      : super(key: key);
  final LatLng location;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 80.0,
      child: Column(
        children: [
          const Text(
            "選択した地点で登録しますか？",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                child: Container(
                  height: 30.0,
                  width: 60.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 195, 14, 1),
                      Color.fromARGB(255, 248, 55, 41),
                      Color.fromARGB(255, 217, 81, 81)
                    ]),
                  ),
                  child: const Center(
                    child: Text(
                      "はい",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SetStorePage(
                        latitude: location.latitude,
                        longitude: location.longitude,
                      ),
                    ),
                  );
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
              MaterialButton(
                child: Container(
                  height: 30.0,
                  width: 60.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.blue,
                      Colors.lightBlue,
                      Colors.blueAccent
                    ]),
                  ),
                  child: const Center(
                    child: Text(
                      "いいえ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ref.read(mapControllerProvider).resetAddress();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
