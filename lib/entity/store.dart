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
      required this.timeStamp,
      required this.ramenImage});

  factory Store.create({
    required String name,
    required String price,
    required String memo,
    required String area,
    required double latitude,
    required double longitude,
    required String ramenImage,
  }) {
    return Store(
      storeId: const Uuid().v4(),
      name: name,
      price: price,
      memo: memo,
      area: area,
      location: GeoPoint(latitude, longitude),
      timeStamp: DateTime.now(),
      ramenImage: ramenImage,
    );
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
      ramenImage: map['ramenImage'],
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
      'ramenImage': ramenImage,
    };
  }

  final String storeId;
  final String name;
  final String price;
  final String memo;
  final String area;
  final location;
  final DateTime timeStamp;
  final String ramenImage;
}
