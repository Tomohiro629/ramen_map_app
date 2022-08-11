import 'package:uuid/uuid.dart';

class Store {
  Store({
    required this.storeId,
    required this.name,
    required this.price,
    required this.memo,
    required this.latitude,
    required this.longitude,
  });

  factory Store.create({
    required String name,
    required String price,
    required String memo,
    required double latitude,
    required double longitude,
  }) {
    return Store(
        storeId: const Uuid().v4(),
        name: name,
        price: price,
        memo: memo,
        latitude: latitude,
        longitude: longitude);
  }

  factory Store.fromJson(Map<String, dynamic> map) {
    return Store(
        storeId: map['id'],
        name: map['name'],
        price: map['price'],
        memo: map['memo'],
        latitude: map['latitude'],
        longitude: map['longitube']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': storeId,
      'name': name,
      'price': price,
      'memo': memo,
      'latitude': latitude,
      'longitube': longitude,
    };
  }

  final String storeId;
  final String name;
  final String price;
  final String memo;
  final double latitude;
  final double longitude;
}
