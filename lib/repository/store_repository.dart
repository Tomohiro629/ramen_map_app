import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/entity/store.dart';

final storeRepositoryProvider = Provider(((ref) {
  return StoreRepository();
}));

class StoreRepository {
  final _firestore = FirebaseFirestore.instance;

  Stream<List<Store>> fetchStoresStream() {
    final snapshot = _firestore.collection('stores').snapshots();

    return snapshot.map((qs) => qs.docs.map((doc) {
          Map<String, dynamic> data = doc.data();
          final String id = data['id'];
          final String storename = data['store'];
          final String price = data['price'];
          final String memo = data['memo'];
          final String area = data['area'];

          return Store(
            storeId: id,
            name: storename,
            price: price,
            memo: memo,
            area: area,
            latitude: 0.0,
            longitude: 0.0,
          );
        }).toList());
  }

  Future<void> setStore({required Store store}) async {
    try {
      await _firestore
          .collection("stores")
          .doc(store.storeId)
          .set(store.toJson(), SetOptions(merge: true));
    } catch (e) {
      const Dialog(
        child: Text("Set Error"),
      );
    }
  }
}
