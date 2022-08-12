import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Store {
  Store(
      {required this.storeId,
      required this.name,
      required this.price,
      required this.memo,
      required this.area,
      required this.location,
      required this.timeStamp});

  factory Store.create({
    required String name,
    required String price,
    required String memo,
    required String area,
    required double latitude,
    required double longitude,
  }) {
    return Store(
        storeId: const Uuid().v4(),
        name: name,
        price: price,
        memo: memo,
        area: area,
        location: GeoPoint(latitude, longitude),
        timeStamp: DateTime.now());
  }

  factory Store.fromJson(Map<String, dynamic> map) {
    return Store(
      storeId: map['id'],
      name: map['name'],
      price: map['price'],
      memo: map['memo'],
      area: map['area'],
      location: map['location'],
      timeStamp: (map['timeStamp']! as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': storeId,
      'name': name,
      'price': price,
      'memo': memo,
      'area': area,
      'location': location,
      'timeStamp': timeStamp,
    };
  }

  final String storeId;
  final String name;
  final String price;
  final String memo;
  final String area;
  final location;
  final DateTime timeStamp;
}
