import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/store_set_page/components/area_field.dart';
import 'package:ramen_map_app/store_set_page/components/memo_field.dart';
import 'package:ramen_map_app/store_set_page/components/price_field.dart';
import 'package:ramen_map_app/store_set_page/components/store_field.dart';

class StoreSetPage extends ConsumerWidget {
  const StoreSetPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'お店登録',
              style: TextStyle(),
            ),
            centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [StoreField(), PriceField(), MemoField(), AreaField()],
          ),
        ));
  }
}
