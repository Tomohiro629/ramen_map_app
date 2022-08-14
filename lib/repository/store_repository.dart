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

    return snapshot
        .map((qs) => qs.docs.map((doc) => Store.fromJson(doc.data())).toList());
  }

  Future<Store> getStore() async {
    final snapshot = await _firestore.collection('stores').doc().get();
    return Store.fromJson(snapshot.data()!);
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

  Query<Store> queryStore() {
    final query =
        _firestore.collection("stores").orderBy('timeStamp', descending: false);
    return query.withConverter(
        fromFirestore: (snapshot, _) => Store.fromJson(snapshot.data()!),
        toFirestore: (store, _) => store.toJson());
  }
}
