import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/repository/store_repository.dart';

final editStoreControllerProvider =
    ChangeNotifierProvider<EditStoreController>((ref) {
  return EditStoreController(ref.read);
});

class EditStoreController extends ChangeNotifier {
  final Reader _reader;
  EditStoreController(this._reader);

  Future<void> updateStore({
    required String storeId,
    required String editStoreName,
    required String editPrice,
    required String editMemo,
    required String editArea,
    required String editTaste,
    required String editRamenImage,
  }) async {
    await _reader(storeRepositoryProvider).updateStore(
        storeId: storeId,
        editStoreName: editStoreName,
        editPrice: editPrice,
        editMemo: editMemo,
        editArea: editArea,
        editTaste: editTaste,
        editRamenImage: editRamenImage);
    notifyListeners();
  }
}
