import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storeSerControllerProvider =
    ChangeNotifierProvider<StoreSetController>((ref) {
  return StoreSetController();
});

class StoreSetController extends ChangeNotifier {}
