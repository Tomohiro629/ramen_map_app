import 'package:cloud_firestore/cloud_firestore.dart';
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
    required this.addCheck,
    required this.isFavorite,
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
    required int addCheck,
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
      addCheck: addCheck,
      isFavorite: false, // 最初はfalse
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
      addCheck: map['addCheck'],
      isFavorite: map['isFavorite'],
    );
  }

  Store update({
    required String name,
    required String price,
    required String memo,
    required String area,
    required String taste,
    required String ramenImage,
  }) {
    return _copyWith(
      name: name,
      price: price,
      memo: memo,
      area: area,
      taste: taste,
      ramenImage: ramenImage,
    );
  }

  Store _copyWith({
    String? name,
    String? price,
    String? memo,
    String? area,
    String? taste,
    String? ramenImage,
    bool? isFavorite,
  }) {
    return Store(
      storeId: storeId,
      name: name ?? this.name,
      price: price ?? this.price,
      memo: memo ?? this.memo,
      area: area ?? this.area,
      taste: taste ?? this.taste,
      timeStamp: timeStamp,
      ramenImage: ramenImage ?? this.ramenImage,
      latitude: latitude,
      longitude: longitude,
      userId: userId,
      addCheck: addCheck,
      isFavorite: isFavorite ?? this.isFavorite,
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
      'addCheck': addCheck,
      'isFavorite': isFavorite,
    };
  }

  final String storeId;
  final String name;
  final String price;
  final String memo;
  final String area;
  final String taste;
  final double latitude;
  final double longitude;
  final DateTime timeStamp;
  final String ramenImage;
  final String userId;
  final int? addCheck;
  final bool isFavorite;
}
