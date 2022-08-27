import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/repository/store_repository.dart';

final editStoreControllerProvider =
    ChangeNotifierProvider.family<EditStoreController, Store>((ref, store) {
  return EditStoreController(ref.read, store);
});

class EditStoreController extends ChangeNotifier {
  final Reader _reader;
  final Store _store;
  EditStoreController(
    this._reader,
    this._store,
  );

  Future<void> updateStore({
    required String editStoreName,
    required String editPrice,
    required String editMemo,
    required String editArea,
    required String editTaste,
    required String editRamenImage,
  }) async {
    final updatedStore = _store.update(
      name: editStoreName,
      price: editPrice,
      memo: editMemo,
      area: editArea,
      taste: editTaste,
      ramenImage: editRamenImage,
    );
    await _reader(storeRepositoryProvider).setStore(store: updatedStore);
    notifyListeners();
  }
}
