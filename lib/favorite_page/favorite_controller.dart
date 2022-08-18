import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/entity/store.dart';
import 'package:ramen_map_app/repository/store_repository.dart';
import 'package:ramen_map_app/service/auth_service.dart';

final favoriteProvider = ChangeNotifierProvider<FavoriteController>((ref) {
  return FavoriteController(ref.read);
});

class FavoriteController extends ChangeNotifier {
  final Reader reader;
  FavoriteController(this.reader);

  Query<Store> favoriteQuery() {
    final userId = reader(authServiceProvider).userId;
    return reader(storeRepositoryProvider).queryFavorite(userId: userId);
  }
}
