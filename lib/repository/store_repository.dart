import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/entity/store.dart';

final storeRepositoryProvider = Provider(((ref) {
  return StoreRepository();
}));

class StoreRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<void> deleteStore(String storeId) async {
    await _firestore.collection('stores').doc(storeId).delete();
  }

  Stream<List<Store>> fetchStoresStream() {
    final snapshot = _firestore.collection('stores').snapshots();

    return snapshot
        .map((qs) => qs.docs.map((doc) => Store.fromJson(doc.data())).toList());
  }

  Stream<Store?> getStore({required String? storeId}) {
    final snapshot = _firestore.collection('stores').doc(storeId).snapshots();
    return snapshot.map((doc) => Store.fromJson(doc.data()!));
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

  Query<Store> queryAreaStore(
      {required String taste, required String area, required String userId}) {
    final query = _firestore
        .collection("stores")
        .where('userId', isEqualTo: userId)
        .where('taste', isEqualTo: taste)
        .where('area', isEqualTo: area)
        .orderBy('timeStamp', descending: false);
    return query.withConverter(
        fromFirestore: (snapshot, _) => Store.fromJson(snapshot.data()!),
        toFirestore: (store, _) => store.toJson());
  }

  Query<Store> queryDistanceStore({required String userId}) {
    final query = _firestore
        .collection("stores")
        .where('userId', isEqualTo: userId)
        .orderBy('storeDistance', descending: false); //現在地より近い順
    return query.withConverter(
        fromFirestore: (snapshot, _) => Store.fromJson(snapshot.data()!),
        toFirestore: (store, _) => store.toJson());
  }

  Query<Store> queryFavorite({required String userId}) {
    final query = _firestore
        .collection("stores")
        .where('userId', isEqualTo: userId)
        .where('isFavorite', isEqualTo: true)
        .orderBy('timeStamp', descending: false);
    return query.withConverter(
        fromFirestore: (snapshot, _) => Store.fromJson(snapshot.data()!),
        toFirestore: (store, _) => store.toJson());
  }

  Query<Store> queryTasteStore(
      {required String taste, required String userId}) {
    final query = _firestore
        .collection("stores")
        .where('userId', isEqualTo: userId)
        .where('taste', isEqualTo: taste)
        .orderBy('timeStamp', descending: false);
    return query.withConverter(
        fromFirestore: (snapshot, _) => Store.fromJson(snapshot.data()!),
        toFirestore: (store, _) => store.toJson());
  }
}
