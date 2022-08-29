import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/repository/store_repository.dart';

final setStoreControllerProvider =
    ChangeNotifierProvider<SetStoreController>((ref) {
  return SetStoreController(ref.read);
});

class SetStoreController extends ChangeNotifier {
  final Reader _reader;
  SetStoreController(this._reader);
  bool isLoading = false;

  void loadingScreen() {
    isLoading = true;
    notifyListeners();
  }

  Future<void> setStore({
    required String name,
    required String price,
    required String memo,
    required String area,
    required String taste,
    required double latitude,
    required double longitude,
    required String ramenImage,
    required String userId,
  }) async {
    final store = Store.create(
      name: name,
      price: price,
      memo: memo,
      area: area,
      taste: taste,
      latitude: latitude,
      longitude: longitude,
      ramenImage: ramenImage,
      userId: userId,
    );
    await _reader(storeRepositoryProvider).setStore(store: store);
  }
}
