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

  Future<void> setStore({
    required String name,
    required String price,
    required String memo,
    required String area,
    required double latitude,
    required double longitude,
    required String ramenImage,
  }) async {
    final store = Store.create(
        name: name,
        price: price,
        memo: memo,
        area: area,
        latitude: latitude,
        longitude: longitude,
        ramenImage: ramenImage);
    await _reader(storeRepositoryProvider).setStore(store: store);
  }
}
