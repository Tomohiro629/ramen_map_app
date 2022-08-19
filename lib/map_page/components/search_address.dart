import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:ramen_map_app/map_page/map_controller.dart';
import 'package:ramen_map_app/set_store_page/set_store_page.dart';

class SearchAddress extends ConsumerWidget {
  const SearchAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapControllerProvider);
    final inputAddress = TextEditingController();

    return Column(
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
                                List location = await locationFromAddress(
                                    mapController.predictions[index].description
                                        .toString());
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SetStorePage(
                                      latitude: location.first.latitude,
                                      longitude: location.first.longitude,
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
    );
  }
}
