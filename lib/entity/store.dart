import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

class Store {
  Store({
    required this.storeId,
    required this.name,
    required this.price,
    required this.memo,
    required this.area,
    required this.taste,
    required this.timeStamp,
    required this.ramenImage,
    required this.latitude,
    required this.longitude,
    required this.userId,
  });

  factory Store.create({
    required String name,
    required String price,
    required String memo,
    required String area,
    required String taste,
    required double latitude,
    required double longitude,
    required String ramenImage,
    required String userId,
  }) {
    return Store(
      storeId: const Uuid().v4(),
      name: name,
      price: price,
      memo: memo,
      area: area,
      taste: taste,
      latitude: latitude,
      longitude: longitude,
      timeStamp: DateTime.now(),
      ramenImage: ramenImage,
      userId: userId,
    );
  }

  factory Store.fromJson(Map<String, dynamic> map) {
    return Store(
      storeId: map['id'],
      name: map['name'],
      price: map['price'],
      memo: map['memo'],
      area: map['area'],
      taste: map['taste'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      timeStamp: (map['timeStamp']! as Timestamp).toDate(),
      ramenImage: map['ramenImage'],
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': storeId,
      'name': name,
      'price': price,
      'memo': memo,
      'area': area,
      'taste': taste,
      'latitude': latitude,
      'longitude': longitude,
      'timeStamp': timeStamp,
      'ramenImage': ramenImage,
      'userId': userId,
    };
  }

  final String storeId;
  final String name;
  final String price;
  final String memo;
  final String area;
  final String taste;
  final double? latitude;
  final double? longitude;
  final DateTime timeStamp;
  final String ramenImage;
  final String userId;
}
