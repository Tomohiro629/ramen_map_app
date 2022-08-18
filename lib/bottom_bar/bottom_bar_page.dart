import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/bottom_bar/bottom_bar_controller.dart';
import 'package:ramen_map_app/favorite_page/favorite_page.dart';
import 'package:ramen_map_app/map_page/map_controller.dart';
import 'package:ramen_map_app/map_page/map_page.dart';
import 'package:ramen_map_app/taste_list/taste_list_page.dart';

class BottomBarPage extends ConsumerWidget {
  BottomBarPage({
    Key? key,
  }) : super(key: key);

  final pages = [
    const TasteListPage(),
    const FavoritePage(),
    const MapPage(
      storeId: "",
    )
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //currentIndexを定義
    final currentIndex = ref.watch(bottomBarControllerProvider);
    final mapContoroller = ref.watch(mapControllerProvider);

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.deepOrange,
          items: const <Widget>[
            Icon(
              Icons.list_alt_outlined,
              color: Colors.deepOrange,
            ),
            Icon(
              Icons.favorite_outline,
              color: Colors.deepOrange,
            ),
            Icon(
              Icons.pin_drop_outlined,
              color: Colors.deepOrange,
            ),
          ],
          onTap: (i) {
            mapContoroller.markers = {};
            ref.watch(bottomBarControllerProvider.notifier).changeIndex(i);
          }),
    );
  }
}
