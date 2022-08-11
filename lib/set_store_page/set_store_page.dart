import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramen_map_app/set_store_page/components/area_field.dart';
import 'package:ramen_map_app/set_store_page/components/memo_field.dart';
import 'package:ramen_map_app/set_store_page/components/price_field.dart';
import 'package:ramen_map_app/set_store_page/components/set_button.dart';
import 'package:ramen_map_app/set_store_page/components/store_field.dart';

class SetStorePage extends ConsumerWidget {
  const SetStorePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'お店登録',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StoreField(),
              PriceField(),
              MemoField(),
              AreaField(),
              const SetButton()
            ],
          ),
        ));
  }
}
