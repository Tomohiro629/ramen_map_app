import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/bottom_bar/bottom_bar_controller.dart';
import 'package:ramen_map_app/favorite_page/favorite_page.dart';
import 'package:ramen_map_app/map_page/map_controller.dart';
import 'package:ramen_map_app/map_page/map_page.dart';

import 'package:ramen_map_app/store_list_page/store_list_page.dart';
import 'package:ramen_map_app/taste_list/components/taste_list.dart';
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
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black38,
          backgroundColor: const Color.fromARGB(163, 238, 138, 7),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list_alt_outlined,
                ),
                label: '一覧'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_outline,
                ),
                label: 'お気に入り'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pin_drop_outlined,
                ),
                label: '地図'),
          ],
          currentIndex: currentIndex,
          onTap: (int i) {
            // mapContoroller.markers = {};
            ref.watch(bottomBarControllerProvider.notifier).changeIndex(i);
          }),
    );
  }
}
