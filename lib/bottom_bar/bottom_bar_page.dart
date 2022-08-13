import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/bottom_bar/bottom_bar_controller.dart';
import 'package:ramen_map_app/map_page/map_page.dart';
import 'package:ramen_map_app/store_list_page/store_list_page.dart';

class BottomNavigationBarPage extends ConsumerWidget {
  BottomNavigationBarPage({
    Key? key,
  }) : super(key: key);

  final pages = [const StoreListPage(), const MapPage()];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //currentIndexを定義
    final currentIndex = ref.watch(bottomBarControllerProvider);
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined), label: '一覧'),
          BottomNavigationBarItem(
              icon: Icon(Icons.pin_drop_outlined), label: '地図'),
        ],
        currentIndex: currentIndex,
        onTap: (int i) {
          ref.watch(bottomBarControllerProvider.notifier).changeIndex(i);
        },
      ),
    );
  }
}
