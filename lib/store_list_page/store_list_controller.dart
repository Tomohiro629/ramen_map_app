import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/map_page/map_controller.dart';
import 'package:ramen_map_app/repository/store_repository.dart';
import 'package:ramen_map_app/service/auth_service.dart';

final storeListProvider =
    ChangeNotifierProvider.family<StoreListController, Store>((ref, store) {
  return StoreListController(ref.read, store);
});

class StoreListController extends ChangeNotifier {
  final Reader reader;
  final Store store;
  StoreListController(this.reader, this.store) {
    setStoreDistance(store);
    notifyListeners();
  }

  Future<void> deleteStore(String storeId) async {
    reader(storeRepositoryProvider).deleteStore(storeId);
  }

  Future<void> setStoreDistance(Store store) async {
    final currentPosition = reader(mapControllerProvider).initialPosition!;
    final int distanceInMeters = Geolocator.distanceBetween(
            currentPosition.latitude,
            currentPosition.longitude,
            store.latitude,
            store.longitude)
        .toInt();

    await reader(storeRepositoryProvider)
        .setStore(store: store.addStoreDistance(distanceInMeters));
    notifyListeners();
  }

  Query<Store> tasteStoreQuery(String taste) {
    final userId = reader(authServiceProvider).userId;
    return reader(storeRepositoryProvider)
        .queryTasteStore(taste: taste, userId: userId);
  }
}
